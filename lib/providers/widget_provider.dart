import 'package:flutter/cupertino.dart';

class WidgetProvider with ChangeNotifier {
  List<Widget> _widgets = [];

  List<Widget> get widget => _widgets;

  void addWidgets(Widget widget) {
    _widgets.add(widget);
    notifyListeners();
  }
}