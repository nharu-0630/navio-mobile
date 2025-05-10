import 'package:flutter/material.dart';
import 'package:navio_mobile/database/database.dart';
import 'package:provider/provider.dart';

import 'provider/pdf_provider.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PDFProvider())],
      child: Provider(
        create: (_) => Database(),
        dispose: (_, Database db) => db.close(),
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
