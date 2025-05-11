import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:navio_mobile/database/building_dao.dart';
import 'package:navio_mobile/database/database.dart';
import 'package:navio_mobile/database/todo_dao.dart';
import 'package:provider/provider.dart';

class BuildingTodoScreen extends StatefulWidget {
  const BuildingTodoScreen({super.key});

  @override
  State<BuildingTodoScreen> createState() => _BuildingTodoScreenState();
}

class _BuildingTodoScreenState extends State<BuildingTodoScreen> {
  BuildingDao? _buildingDao;
  TodoDao? _todoDao;
  Building? _selectedBuilding;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final db = Provider.of<Database>(context);
    _buildingDao = db.buildingDao;
    _todoDao = db.todoDao;
  }

  void _toggleTodoDone(Todo todo) {
    final updatedTodo = todo.copyWith(isDone: !todo.isDone);
    _todoDao?.updateTodo(updatedTodo);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          StreamBuilder<List<Building>>(
            stream: _buildingDao?.watchAllBuildings(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('地図がありません'));
              }
              return DropdownButton<Building>(
                value: _selectedBuilding,
                hint: const Text('地図を選択してください'),
                items:
                    snapshot.data!.map((building) {
                      return DropdownMenuItem<Building>(
                        value: building,
                        child: Text(building.name),
                      );
                    }).toList(),
                onChanged: (Building? newValue) {
                  setState(() {
                    _selectedBuilding = newValue;
                  });
                },
              );
            },
          ),
          Expanded(
            flex: 1,
            child:
                _selectedBuilding != null
                    ? PDFView(
                      pdfData: _selectedBuilding!.content,
                      enableSwipe: true,
                      swipeHorizontal: true,
                      autoSpacing: false,
                      pageFling: true,
                      onError: (error) {
                        debugPrint('Error: $error');
                      },
                      onPageError: (page, error) {
                        debugPrint('Page error: $error');
                      },
                    )
                    : const Center(child: Text('建物を選択してください')),
          ),
          Expanded(
            flex: 1,
            child: StreamBuilder<List<Todo>>(
              stream: _todoDao?.watchAllTodos(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('アイテムがありません'));
                }
                final todos = snapshot.data!;
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return _todoWidget(todo);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile _todoWidget(Todo todo) {
    return ListTile(
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (value) {
          _toggleTodoDone(todo);
        },
      ),
      title: Text(todo.title),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          _todoDao?.deleteTodo(todo);
        },
      ),
    );
  }
}
