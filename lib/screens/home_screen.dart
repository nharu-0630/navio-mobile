import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:navio_mobile/screens/notes_screen.dart';
import 'package:provider/provider.dart';

import '../providers/pdf_map_provider.dart';
import '../providers/shopping_list_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // データの初期ロード
    Future.microtask(() {
      Provider.of<ShoppingListProvider>(context, listen: false).loadItems();
      Provider.of<PDFMapProvider>(context, listen: false).loadSavedMap();
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _addItem() {
    if (_textController.text.isNotEmpty) {
      Provider.of<ShoppingListProvider>(
        context,
        listen: false,
      ).addItem(_textController.text);
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('買い物リスト & マップ')),
      body: Column(
        children: [
          // PDFマップビューア（画面の上半分）
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

          // 買い物リスト（画面の下半分）
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
                          onSubmitted: (_) => _addItem(),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: _addItem,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Consumer<ShoppingListProvider>(
                    builder: (context, provider, child) {
                      if (provider.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (provider.items.isEmpty) {
                        return const Center(child: Text('買い物リストが空です'));
                      }

                      return ListView.builder(
                        itemCount: provider.items.length,
                        itemBuilder: (context, index) {
                          final item = provider.items[index];
                          return ListTile(
                            title: Text(
                              item.name,
                              style: TextStyle(
                                decoration:
                                    item.isCompleted
                                        ? TextDecoration.lineThrough
                                        : null,
                              ),
                            ),
                            leading: Checkbox(
                              value: item.isCompleted,
                              onChanged: (_) {
                                provider.toggleItemStatus(item.id!);
                              },
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                provider.deleteItem(item.id!);
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
                ActionButton(
                  icon: Icons.delete_sweep,
                  label: '完了アイテム削除',
                  onPressed: () {
                    _deleteCompletedItems(context);
                  },
                ),
                ActionButton(
                  icon: Icons.note_add,
                  label: 'メモ',
                  onPressed: () {
                    _showNotesDialog(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _deleteCompletedItems(BuildContext context) {
    final provider = Provider.of<ShoppingListProvider>(context, listen: false);
    final completedItems =
        provider.items.where((item) => item.isCompleted).toList();

    if (completedItems.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('完了したアイテムはありません')));
      return;
    }

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('確認'),
            content: const Text('完了したアイテムをすべて削除しますか？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('キャンセル'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  for (var item in completedItems) {
                    provider.deleteItem(item.id!);
                  }
                },
                child: const Text('削除'),
              ),
            ],
          ),
    );
  }

  // void _showNotesDialog(BuildContext context) {
  //   final TextEditingController noteController = TextEditingController();

  //   showDialog(
  //     context: context,
  //     builder:
  //         (context) => AlertDialog(
  //           title: const Text('メモ'),
  //           content: TextField(
  //             controller: noteController,
  //             maxLines: 5,
  //             decoration: const InputDecoration(
  //               hintText: 'メモを入力してください',
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.pop(context),
  //               child: const Text('キャンセル'),
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 // ここでメモを保存する処理を追加できます
  //                 Navigator.pop(context);
  //                 ScaffoldMessenger.of(
  //                   context,
  //                 ).showSnackBar(const SnackBar(content: Text('メモを保存しました')));
  //               },
  //               child: const Text('保存'),
  //             ),
  //           ],
  //         ),
  //   );
  // }

  void _showNotesDialog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotesScreen()),
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
