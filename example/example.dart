import 'dart:io';
import 'package:code_formatter_package/code_formatter_package.dart';

void main() {
  // Example: Load large Dart code from a file
  String largeCode = File('large_code.dart').readAsStringSync();
  
  // Example: Use the CodeFormatter to split the code into multiple widgets
  CodeFormatter.formatCode(largeCode);
  
  // Example: Use custom widget names
  CodeFormatter.formatCode(
    largeCode,
    customNames: ['HomeWidget', 'ProfileWidget', 'SettingsWidget'],
  );
}
