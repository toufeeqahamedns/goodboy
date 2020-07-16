import 'package:flutter/material.dart';

class SimpleMessage extends StatelessWidget {
  final String message;
  final bool isBot;

  SimpleMessage({this.message, this.isBot});

  Widget myMessage(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Flexible(
            child: Card(
              color: Color(0xFFB5B9EB),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(message, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Color(0xFF747FFC),
              foregroundColor: Colors.black,
                child: Icon(
              Icons.person,
            )),
          )
        ],
      ),
    );
  }

  Widget botMessage(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(child: Image.asset("assets/bot.png")),
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Card(
              color: Color(0xFF747FFC),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isBot ? botMessage(context) : myMessage(context);
  }
}
