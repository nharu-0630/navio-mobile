import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/api_data_viewmodel.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // 画面表示時にローカルデータを読み込む
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ApiDataViewModel>().loadLocalData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Data'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<ApiDataViewModel>().fetchData();
            },
          ),
        ],
      ),
      body: Consumer<ApiDataViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${viewModel.errorMessage}',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => viewModel.loadLocalData(),
                    child: const Text('Load Local Data'),
                  ),
                ],
              ),
            );
          }

          if (viewModel.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No data available'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => viewModel.fetchData(),
                    child: const Text('Fetch Data'),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: viewModel.items.length,
            itemBuilder: (context, index) {
              final item = viewModel.items[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(item.circleID),
                  subtitle: Text(item.name),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.imageURL),
                  ),
                  trailing: Text(item.space),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
