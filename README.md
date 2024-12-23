Code Formatter Package

A Flutter package for formatting and splitting large Dart code into smaller widget files. This package is especially useful for organizing long widget-based code into manageable parts.

Features

Automatically splits long Dart code into multiple widgets.

Saves each widget in a separate file.

Allows users to specify custom names for the generated widget files.

Installation

Add the following line to your pubspec.yaml file:

dependencies:
  code_formatter_package:
    git:
      url: https://github.com/Mrkhan012/code_formatter_package

Then run:

flutter pub get

Usage

Import the Package

import 'package:code_formatter_package/code_formatter_package.dart';

Format Code

Use the CodeFormatter.formatCode method to split your code into multiple widgets:

import 'dart:io';
import 'package:code_formatter_package/code_formatter_package.dart';

void main() {
  String largeCode = File('large_code.dart').readAsStringSync();
  CodeFormatter.formatCode(largeCode);
}

Format Code with Custom Widget Names

You can specify custom names for the widgets:

void main() {
  String largeCode = File('large_code.dart').readAsStringSync();
  CodeFormatter.formatCodeWithCustomNames(
    largeCode,
    ['HomeWidget', 'ProfileWidget', 'SettingsWidget'],
  );
}

Example

Given a large Dart file large_code.dart containing:

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Running the formatter will generate separate files:

widget_1.dart

widget_2.dart

or with custom names:

HomeWidget.dart

ProfileWidget.dart

Running Tests

The package includes unit tests to verify functionality. Run tests using:

flutter test

Contributions

Contributions are welcome! Please open an issue or submit a pull request on GitHub.

License

MIT License