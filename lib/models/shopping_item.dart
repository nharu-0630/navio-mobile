class ShoppingItem {
  final int? id;
  final String name;
  bool isCompleted;

  ShoppingItem({this.id, required this.name, this.isCompleted = false});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'isCompleted': isCompleted ? 1 : 0};
  }

  factory ShoppingItem.fromMap(Map<String, dynamic> map) {
    return ShoppingItem(
      id: map['id'],
      name: map['name'],
      isCompleted: map['isCompleted'] == 1,
    );
  }
}
