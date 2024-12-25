import 'package:code_formatter_package/code_formatter_package.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // Call the formatter when the HomeScreen is initialized
    CodeFormatter.initializeFormatter(
      'lib/home_screen.dart', // Path to the file to format
      customNames: ['HomeScreen'], // Optional: Custom names for generated files
      outputDir: 'lib/generated_widgets', // Specify output directory
    );

    // Optionally log or show a message to indicate that formatting has been initiated
    print('HomeScreen code formatting has been initiated!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Formatter',
      home: Scaffold(
        appBar: AppBar(title: Text('Code Formatter Test')),
        body: Center(child: Text('HomeScreen code is being formatted!')),
      ),
    );
  }
}
