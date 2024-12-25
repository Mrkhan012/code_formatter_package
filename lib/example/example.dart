import 'package:flutter/material.dart';
import 'package:code_formatter_package/code_formatter_package.dart'; // Import your package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // Automatically format a Dart file when the app starts
    CodeFormatter.initializeFormatter(
      'lib/sample_code.dart', // Path to your Dart file that you want to format
      customNames: [
        'HomeWidget',
        'DetailsWidget'
      ], // Optional custom names for widget files
      outputDir:
          'lib/generated_widgets', // Directory to save formatted widget files
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Code Formatter Example')),
      body: const Center(child: Text('Check your generated widgets!')),
    );
  }
}
