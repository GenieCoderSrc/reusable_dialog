import 'package:flutter/material.dart';
import 'package:reusable_dialog/app_dialogs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reusable Dialog Example',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AppDialog.warning(
              context: context,
              title: 'Warning',
              msg: 'Do you really want to continue?',
              onOk: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Action confirmed.')),
                );
              },
            );
          },
          child: const Text('Show Warning Dialog'),
        ),
      ),
    );
  }
}
