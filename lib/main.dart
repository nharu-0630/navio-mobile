import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di/service_locator.dart';
import 'screens/home_screen.dart';
import 'viewmodels/api_data_viewmodel.dart';
import 'viewmodels/settings_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<SettingsViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<ApiDataViewModel>()),
      ],
      child: MaterialApp(
        title: 'Navio Mobile',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: const HomeScreen(),
      ),
    );
  }
}
