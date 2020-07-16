import 'package:goodboy/providers/dialofflow_provider.dart';
import 'package:goodboy/providers/message_provider.dart';
import 'package:goodboy/providers/widget_provider.dart';

class BaseProvider {
  final DialogFlowProvider dialogFlowProvider;
  final WidgetProvider widgetProvider;
  final MessageProvider messageProvider;

  BaseProvider({this.dialogFlowProvider, this.widgetProvider, this.messageProvider});

  Future<void> initiateFirstIntent(res) async {
    await messageProvider.classifyMessage(res, widgetProvider);
  }

  Future<void> initiateIntent(String request) async {
    final dynamic res = await dialogFlowProvider.detectIntent(request);

    await messageProvider.classifyMessage(res, widgetProvider);
  }
}
