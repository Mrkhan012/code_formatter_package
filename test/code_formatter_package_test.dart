import 'dart:io';
import 'package:code_formatter_package/code_formatter_package.dart';
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
  test('formats large code into multiple widgets', () {
    CodeFormatter.formatCode(largeCode);

    // Verify files are created
    for (int i = 1; i <= 2; i++) {
      final file = File('widget_$i.dart');
      expect(file.existsSync(), true, reason: 'File widget_$i.dart was not created');
    }
  });

  // Cleanup after tests
  tearDown(() {
    for (int i = 1; i <= 2; i++) {
      final file = File('widget_$i.dart');
      if (file.existsSync()) {
        file.deleteSync();
      }
    }
  });
}
