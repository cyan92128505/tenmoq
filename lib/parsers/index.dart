import 'package:dynamic_widget/dynamic_widget.dart';
import 'binding_value.dart';

enum CustomParserType {
  binding_value,
}

class CustomParserTool {
  static String getEnumValue(CustomParserType c) => c.toString().split('.')[1];

  static setup() {
    DynamicWidgetBuilder.addParser(BindingValueParser());
  }
}

class DefaultClickListener implements ClickListener {
  @override
  void onClicked(String event) {
    print("Receive click event: " + event);
  }
}
