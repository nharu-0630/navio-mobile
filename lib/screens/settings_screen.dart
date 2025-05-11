import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/api_settings.dart';
import '../viewmodels/api_data_viewmodel.dart';
import '../viewmodels/settings_viewmodel.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _cookieController;
  late TextEditingController _apiUrlController;

  @override
  void initState() {
    super.initState();
    final settings = context.read<SettingsViewModel>().settings;
    _cookieController = TextEditingController(text: settings.cookieValue);
    _apiUrlController = TextEditingController(text: settings.apiUrl);
  }

  @override
  void dispose() {
    _cookieController.dispose();
    _apiUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Settings')),
      body: Consumer<SettingsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _apiUrlController,
                    decoration: const InputDecoration(
                      labelText: 'API URL',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter API URL';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _cookieController,
                    decoration: const InputDecoration(
                      labelText: 'Cookie Value',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter cookie value';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final newSettings = ApiSettings(
                          cookieValue: _cookieController.text,
                          apiUrl: _apiUrlController.text,
                        );

                        await viewModel.saveSettings(newSettings);

                        // ApiDataViewModelの設定も更新
                        context.read<ApiDataViewModel>().updateSettings(
                          newSettings,
                        );

                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Settings saved')),
                        );

                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save Settings'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
