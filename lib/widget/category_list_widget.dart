import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:navio_mobile/database/category_dao.dart';
import 'package:navio_mobile/database/database.dart';
import 'package:navio_mobile/widget/circle_keyboard_widget.dart';
import 'package:provider/provider.dart';

class CategoryListWidget extends StatefulWidget {
  const CategoryListWidget({super.key});

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  CategoryDao? _categoryDao;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final db = Provider.of<Database>(context);
    _categoryDao = db.categoryDao;
  }

  Future<void> _showAddCategoryModal() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('カテゴリを追加'),
          content: TextField(
            // autofocus: true,
            controller: _controller,
            onTap: _showCustomKeyboard,
            onSubmitted: (value) async {
              if (value.isNotEmpty) {
                await _categoryDao?.insertCategory(
                  CategoriesCompanion(name: Value(value)),
                );
                if (context.mounted) {
                  Navigator.pop(context);
                }
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () async {
                final value = (context.widget as AlertDialog).content;
                if (value is TextField &&
                    value.controller?.text.isNotEmpty == true) {
                  await _categoryDao?.insertCategory(
                    CategoriesCompanion(name: Value(value.controller!.text)),
                  );
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                }
              },
              child: const Text('追加'),
            ),
          ],
        );
      },
    );
  }

  final TextEditingController _controller = TextEditingController();

  void _showCustomKeyboard() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return CircleKeyboard(
          initialValue: _controller.text,
          onValueChanged: (String value) {
            setState(() {
              _controller.text = value;
            });
          },
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          _controller.text = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCategoryModal,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Category>>(
        stream: _categoryDao?.watchAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('アイテムがありません'));
          }
          final categories = snapshot.data!;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return ListTile(
                title: Text(category.name),
                subtitle: Text('ID: ${category.id}'),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
