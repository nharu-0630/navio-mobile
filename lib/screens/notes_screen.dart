import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import '../providers/notes_provider.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<NotesProvider>(context, listen: false).loadNotes();
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _addNote() {
    if (_textController.text.isNotEmpty) {
      Provider.of<NotesProvider>(
        context,
        listen: false,
      ).addNote(_textController.text);
      _textController.clear();
    }
  }

  void _editNote(Note note) {
    _textController.text = note.content;
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('メモを編集'),
            content: TextField(
              controller: _textController,
              maxLines: 5,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('キャンセル'),
              ),
              TextButton(
                onPressed: () {
                  if (_textController.text.isNotEmpty) {
                    Provider.of<NotesProvider>(
                      context,
                      listen: false,
                    ).updateNote(
                      Note(
                        id: note.id,
                        content: _textController.text,
                        createdAt: note.createdAt,
                      ),
                    );
                  }
                  Navigator.pop(context);
                  _textController.clear();
                },
                child: const Text('保存'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('メモ')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: '新しいメモを追加',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                ),
                IconButton(icon: const Icon(Icons.add), onPressed: _addNote),
              ],
            ),
          ),
          Expanded(
            child: Consumer<NotesProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.notes.isEmpty) {
                  return const Center(child: Text('メモがありません'));
                }

                return ListView.builder(
                  itemCount: provider.notes.length,
                  itemBuilder: (context, index) {
                    final note = provider.notes[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: ListTile(
                        title: Text(note.content),
                        subtitle: Text(
                          '${note.createdAt.year}/${note.createdAt.month}/${note.createdAt.day} ${note.createdAt.hour}:${note.createdAt.minute}',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _editNote(note),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                provider.deleteNote(note.id!);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
