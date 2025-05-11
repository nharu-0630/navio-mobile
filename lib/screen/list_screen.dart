import 'package:flutter/material.dart';
import 'package:navio_mobile/widget/building_list_widget.dart';
import 'package:navio_mobile/widget/category_list_widget.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            const Tab(text: '地図'),
            const Tab(text: 'カテゴリ'),
            const Tab(text: 'サークル'),
            const Tab(text: 'アイテム'),
          ],
        ),
        body: TabBarView(
          children: [
            BuildingListWidget(),
            CategoryListWidget(),
            Placeholder(),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
