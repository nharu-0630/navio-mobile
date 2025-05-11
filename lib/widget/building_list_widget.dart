import 'dart:io';

import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:navio_mobile/database/building_dao.dart';
import 'package:navio_mobile/database/database.dart';
import 'package:provider/provider.dart';

class BuildingListWidget extends StatefulWidget {
  const BuildingListWidget({super.key});

  @override
  State<BuildingListWidget> createState() => _BuildingListWidgetState();
}

class _BuildingListWidgetState extends State<BuildingListWidget> {
  BuildingDao? _buildingDao;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final db = Provider.of<Database>(context);
    _buildingDao = db.buildingDao;
  }

  Future<void> _showAddBuildingDialog() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      final file = result.files.single;
      final bytes = await File(file.path!).readAsBytes();
      Navigator.pop(context);
      await _buildingDao?.insertBuilding(
        BuildingsCompanion(name: Value(file.name), content: Value(bytes)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddBuildingDialog,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Building>>(
        stream: _buildingDao?.watchAllBuildings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('アイテムがありません'));
          }
          final buildings = snapshot.data!;
          return ListView.builder(
            itemCount: buildings.length,
            itemBuilder: (context, index) {
              final building = buildings[index];
              return ListTile(
                title: Text(building.name),
                subtitle: Text('ID: ${building.id}'),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
