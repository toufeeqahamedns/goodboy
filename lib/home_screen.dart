import 'package:flutter/material.dart';
import 'package:goodboy/providers/base_provider.dart';
import 'package:goodboy/providers/widget_provider.dart';
import 'package:goodboy/widgets.dart/simple_message.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer2<BaseProvider, WidgetProvider>(
        builder: (BuildContext context, BaseProvider baseProvider,
            WidgetProvider widgetProvider, Widget _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return widgetProvider.widget[index];
                  },
                  itemCount: widgetProvider.widget.length,
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    // Button send image
                    Material(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 1.0),
                        child: IconButton(
                          icon: Icon(Icons.image),
                          color: Colors.blue,
                          onPressed: () {},
                        ),
                      ),
                      color: Colors.white,
                    ),
                    Material(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 1.0),
                        child: IconButton(
                          icon: Icon(Icons.face),
                          color: Colors.blue,
                          onPressed: () {},
                        ),
                      ),
                      color: Colors.white,
                    ),

                    // Edit text
                    Flexible(
                      child: Container(
                        child: TextField(
                          style: TextStyle(color: Colors.blue, fontSize: 15.0),
                          controller: textEditingController,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Type your message...',
                            hintStyle: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Button send message
                    Material(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            if (textEditingController.text.trim() != "") {
                              widgetProvider.addWidgets(SimpleMessage(
                                message: textEditingController.text,
                              ));
                              baseProvider
                                  .initiateIntent(textEditingController.text);
                            } else {
                              
                            }
                          },
                          color: Colors.blue,
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.grey, width: 0.5)),
                    color: Colors.white),
              )
            ],
          );
        },
      ),
    ));
  }
}
