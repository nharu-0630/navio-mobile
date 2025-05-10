import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:navio_mobile/database/database.dart';
import 'package:navio_mobile/database/todo_dao.dart';
import 'package:provider/provider.dart';

import '../provider/pdf_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  TodoDao? _todoDao;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final db = Provider.of<Database>(context);
    _todoDao = db.todoDao;
  }

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<PDFProvider>(context, listen: false);
    Future.microtask(() {
      provider.loadSavedMap();
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _insertTodo() {
    final title = _textController.text.trim();
    if (title.isNotEmpty) {
      final todo = TodosCompanion(
        title: Value(title),
        isDone: const Value(false),
      );
      _todoDao?.insertTodo(todo);
      _textController.clear();
    }
  }

  void _toggleTodoDone(Todo todo) {
    final updatedTodo = todo.copyWith(isDone: !todo.isDone);
    _todoDao?.updateTodo(updatedTodo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Consumer<PDFProvider>(
                builder: (context, pdfProvider, child) {
                  if (pdfProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (pdfProvider.pdfPath == null) {
                    return Center(
                      child: ElevatedButton(
                        onPressed: () {
                          pdfProvider.pickAndSaveMap();
                        },
                        child: const Text('マップをアップロード'),
                      ),
                    );
                  }

                  return PDFView(
                    filePath: pdfProvider.pdfPath!,
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: false,
                    pageFling: false,
                    onError: (error) {
                      debugPrint('Error: $error');
                    },
                    onPageError: (page, error) {
                      debugPrint('Page error: $error');
                    },
                  );
                },
              ),
            ),

            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            decoration: const InputDecoration(
                              hintText: 'アイテムを追加',
                            ),
                            onSubmitted: (_) {
                              _insertTodo();
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: _insertTodo,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<Todo>>(
                      stream: _todoDao?.watchAllTodos(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
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
            ),
          ],
        ),
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
