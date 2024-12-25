import 'dart:io';
import 'package:code_formatter_package/code_formatter_package.dart'; // Make sure to import your formatter package
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Sample large code for testing
  const String largeCode = '''
    class WidgetOne extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Container();
      }
    }
    class WidgetTwo extends StatefulWidget {
      @override
      State<StatefulWidget> createState() => _WidgetTwoState();
    }
    class _WidgetTwoState extends State<WidgetTwo> {
      @override
      Widget build(BuildContext context) {
        return Container();
      }
    }
  ''';

  // Test case for formatting large code
  test('formats large code into multiple widgets', () async {
    // Call the formatCode method
    CodeFormatter.formatCode(largeCode, outputDir: 'lib/generated_widgets');

    // Verify files are created in the correct directory
    for (int i = 1; i <= 2; i++) {
      final file = File('lib/generated_widgets/widget_$i.dart');
      expect(file.existsSync(), true, reason: 'File widget_$i.dart was not created');
    }
  });

  // Cleanup after tests
  tearDown(() {
    for (int i = 1; i <= 2; i++) {
      final file = File('lib/generated_widgets/widget_$i.dart');
      if (file.existsSync()) {
        file.deleteSync();
      }
    }
  });
}
