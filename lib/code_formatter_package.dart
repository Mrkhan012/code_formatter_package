import 'dart:io';

class CodeFormatter {
  // Function to format code and split into widgets
  static void formatCode(String code, {List<String>? customNames}) {
    // Split code by widget-like patterns (e.g., StatelessWidget, StatefulWidget)
    List<String> widgets = _splitIntoWidgets(code);

    // Create files for each widget
    for (int i = 0; i < widgets.length; i++) {
      String widgetName;
      if (customNames != null && i < customNames.length) {
        widgetName = '${customNames[i]}.dart';
      } else {
        widgetName = 'widget_${i + 1}.dart';
      }
      File(widgetName).writeAsStringSync(widgets[i]);
      print('Widget ${i + 1} saved as $widgetName');
    }
  }

  // Function to split the code into widgets
  static List<String> _splitIntoWidgets(String code) {
    // Logic to split the code into different widgets (this is a simplified example)
    List<String> widgets = [];
    String currentWidget = '';
    bool isInsideWidget = false;

    for (var line in code.split('\n')) {
      if (line.contains('class') && line.contains('Widget')) {
        if (isInsideWidget) {
          widgets.add(currentWidget);
        }
        currentWidget = line;
        isInsideWidget = true;
      } else if (isInsideWidget) {
        currentWidget += '\n$line';
      }
    }
    widgets.add(currentWidget); // Add the last widget
    return widgets;
  }
}
