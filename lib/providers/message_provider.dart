import 'package:goodboy/providers/widget_provider.dart';
import 'package:goodboy/widgets.dart/carousel_message.dart';
import 'package:goodboy/widgets.dart/list_message.dart';
import 'package:goodboy/widgets.dart/simple_message.dart';
import 'package:goodboy/widgets.dart/suggestions.dart';

class MessageProvider {
  Future<void> classifyMessage(
      dynamic response, WidgetProvider _widgetProvider) async {
    final List<dynamic> fullfillmentMessages =
        response["queryResult"]["fulfillmentMessages"];

    fullfillmentMessages.forEach((message) {
      if (message.containsKey("simpleResponses")) {
        _widgetProvider.addWidgets(SimpleMessage(
          message: message["simpleResponses"]["simpleResponses"][0]
              ["textToSpeech"],
          isBot: true,
        ));
      } else if (message.containsKey("listSelect")) {
        _widgetProvider.addWidgets(ListMessage(
          items: message["listSelect"]["items"],
          title: message["listSelect"]["title"],
        ));
      } else if (message.containsKey("text")) {
        _widgetProvider.addWidgets(SimpleMessage(
          message: message["text"]["text"][0],
          isBot: true,
        ));
      } else if (message.containsKey("suggestions")) {
        _widgetProvider.addWidgets(Suggestions(
            suggestionsList: message["suggestions"]["suggestions"]));
      } else if (message.containsKey("carouselSelect")) {
        _widgetProvider.addWidgets(CarouselMessage(
          carouselList: message["carouselSelect"]["items"]
        ));
      }
    });
  }
}
