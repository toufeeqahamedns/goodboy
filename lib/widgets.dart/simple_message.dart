import 'package:flutter/material.dart';

class SimpleMessage extends StatelessWidget {

  final String message;

  SimpleMessage({this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(message),
    );
  }
}