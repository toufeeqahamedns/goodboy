import 'package:flutter/material.dart';
import 'package:goodboy/providers/base_provider.dart';
import 'package:goodboy/providers/widget_provider.dart';
import 'package:goodboy/widgets.dart/simple_message.dart';
import 'package:provider/provider.dart';

class Suggestions extends StatelessWidget {
  final List<dynamic> suggestionsList;

  Suggestions({this.suggestionsList});

  List<Widget> _buildSuggestions(
      WidgetProvider widgetProvider, BaseProvider baseProvider) {
    List<Widget> suggestions = [];

    suggestionsList.forEach((suggestion) {
      suggestions.add(OutlineButton(
        highlightedBorderColor: Color(0xFF747FFC),
        shape: StadiumBorder(),
        child: Text(
          suggestion["title"],
          style: TextStyle(fontSize: 16),
        ),
        onPressed: () {
          widgetProvider.addWidgets(SimpleMessage(
            message: suggestion["title"],
            isBot: false,
          ));
          baseProvider.initiateIntent(suggestion["title"]);
        },
      ));
    });

    return suggestions;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<WidgetProvider, BaseProvider>(builder:
        (BuildContext context, WidgetProvider widgetProvider,
            BaseProvider baseProvider, Widget _) {
      return Row(
        children: <Widget>[
          Opacity(
            opacity: 0.0,
            child: Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: CircleAvatar(child: Image.asset("assets/bot.png")),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Wrap(
                spacing: 8.0,
                children: _buildSuggestions(widgetProvider, baseProvider)),
          ),
        ],
      );
    });
  }
}
