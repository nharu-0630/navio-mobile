import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:navio_mobile/database/database.dart';
import 'package:navio_mobile/database/todo_dao.dart';
import 'package:provider/provider.dart';

import '../providers/pdf_map_provider.dart';

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
    Future.microtask(() {
      Provider.of<PDFMapProvider>(context, listen: false).loadSavedMap();
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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Consumer<PDFMapProvider>(
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
                            hintText: '買い物アイテムを追加',
                            border: OutlineInputBorder(),
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
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // 簡易アクションボタン（最下部）
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionButton(
                  icon: Icons.map,
                  label: 'マップ変更',
                  onPressed: () {
                    Provider.of<PDFMapProvider>(
                      context,
                      listen: false,
                    ).pickAndSaveMap();
                  },
                ),
                ActionButton(
                  icon: Icons.link,
                  label: 'URLから取得',
                  onPressed: () {
                    _showUrlInputDialog(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showUrlInputDialog(BuildContext context) {
    final TextEditingController urlController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('PDFのURLを入力'),
            content: TextField(
              controller: urlController,
              decoration: const InputDecoration(
                hintText: 'https://example.com/map.pdf',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.url,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('キャンセル'),
              ),
              TextButton(
                onPressed: () {
                  final url = urlController.text.trim();
                  if (url.isNotEmpty) {
                    Navigator.pop(context);
                    Provider.of<PDFMapProvider>(
                      context,
                      listen: false,
                    ).downloadMapFromUrl(url);
                  }
                },
                child: const Text('ダウンロード'),
              ),
            ],
          ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: Icon(icon), onPressed: onPressed),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
