import 'package:flutter/material.dart';

class Suggestions extends StatelessWidget {

  final List<dynamic> suggestionsList;

  Suggestions({this.suggestionsList});

  

  List<Widget> _buildSuggestions() {
    List<Widget> suggestions = [];

    suggestionsList.forEach((suggestion) { 
      suggestions.add(
        OutlineButton(
          child: Text(suggestion["title"]),
          onPressed: () {},)
      );
    });

    return suggestions;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildSuggestions()
    );
  }
}