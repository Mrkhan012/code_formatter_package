// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as path;

class CodeFormatter {
  /// Formats a Dart code file and splits it into widget files using the analyzer.
  static void formatCode(
    String code, {
    List<String>? customNames,
    String outputDir = 'lib/generated_widgets',
  }) {
    try {
      // Parse the code using Dart's analyzer package
      final parseResult = parseString(content: code);

      // Extract widget classes
      final widgets = _extractWidgets(parseResult.unit);

      // If no widgets found, return without creating files
      if (widgets.isEmpty) {
        print('No widget classes found in the provided code.');
        return;
      }

      // Ensure the output directory exists
      Directory(outputDir).createSync(recursive: true);

      // Create files for each widget
      for (int i = 0; i < widgets.length; i++) {
        final widgetName = customNames != null && i < customNames.length
            ? '${customNames[i]}.dart'
            : 'widget_${i + 1}.dart';

        final filePath = path.join(outputDir, widgetName);
        File(filePath).writeAsStringSync(widgets[i]);
        print('Widget ${i + 1} saved as $filePath');
      }
    } catch (e) {
      print('Error during code formatting: $e');
    }
  }

  /// Extracts widget class definitions from the parsed AST.
  static List<String> _extractWidgets(CompilationUnit unit) {
    final widgets = <String>[];

    for (final declaration in unit.declarations) {
      if (declaration is ClassDeclaration &&
          declaration.extendsClause != null &&
          _isWidget(declaration.extendsClause!.superclass)) {
        // Extract the source code for the widget
        widgets.add(declaration.toSource());
      }
    }

    return widgets;
  }

  /// Checks if the given type is a widget type (StatelessWidget or StatefulWidget).
  static bool _isWidget(TypeAnnotation superclass) {
    if (superclass is NamedType) {
      final name = superclass.name2.lexeme;
      return name == 'StatelessWidget' || name == 'StatefulWidget';
    }
    return false;
  }

  /// Reads a Dart file and formats it into widgets using the analyzer.
  static void formatFile(
    String filePath, {
    List<String>? customNames,
    String outputDir = 'lib/generated_widgets',
  }) {
    try {
      // Read the file content
      final code = File(filePath).readAsStringSync();

      // Format the code
      formatCode(code, customNames: customNames, outputDir: outputDir);
    } on FileSystemException catch (e) {
      print(
          'Error: Unable to read file at $filePath. Ensure the path is correct.');
      print('Details: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
    }
  }

  /// Automatically invokes the formatter in initState.
  static void initializeFormatter(
    String filePath, {
    List<String>? customNames,
    String outputDir = 'lib/generated_widgets',
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      formatFile(filePath, customNames: customNames, outputDir: outputDir);
    });
  }
}
