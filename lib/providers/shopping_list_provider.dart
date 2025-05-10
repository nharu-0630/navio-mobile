import 'package:flutter/foundation.dart';

import '../../models/shopping_item.dart';
import '../../services/database_helper.dart';

class ShoppingListProvider with ChangeNotifier {
  List<ShoppingItem> _items = [];
  bool _isLoading = false;

  List<ShoppingItem> get items => _items;
  bool get isLoading => _isLoading;

  Future<void> loadItems() async {
    _isLoading = true;
    notifyListeners();

    try {
      _items = await DatabaseHelper.instance.getItems();
    } catch (e) {
      debugPrint('Error loading items: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addItem(String name) async {
    final item = ShoppingItem(name: name);

    try {
      final id = await DatabaseHelper.instance.createItem(item);
      _items.add(ShoppingItem(id: id, name: name));
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding item: $e');
    }
  }

  Future<void> toggleItemStatus(int id) async {
    final index = _items.indexWhere((item) => item.id == id);
    if (index >= 0) {
      _items[index].isCompleted = !_items[index].isCompleted;

      try {
        await DatabaseHelper.instance.updateItem(_items[index]);
        notifyListeners();
      } catch (e) {
        debugPrint('Error updating item: $e');
      }
    }
  }

  Future<void> deleteItem(int id) async {
    try {
      await DatabaseHelper.instance.deleteItem(id);
      _items.removeWhere((item) => item.id == id);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting item: $e');
    }
  }
}
