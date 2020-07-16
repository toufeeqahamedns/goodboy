import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goodboy/providers/base_provider.dart';
import 'package:goodboy/providers/widget_provider.dart';
import 'package:goodboy/widgets.dart/image_message.dart';
import 'package:goodboy/widgets.dart/simple_message.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GoodBoy"),
        ),
        body: SafeArea(
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
                      reverse: true,
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
                              color: Color(0xFF747FFC),
                              onPressed: () async {
                                final pickedFile = await picker.getImage(
                                    source: ImageSource.camera);
                                if (pickedFile != null) {
                                  widgetProvider.addWidgets(ImageMessage(
                                    image: File(pickedFile.path),
                                  ));
                                  baseProvider.initiateIntent("image");
                                } else {}
                              },
                            ),
                          ),
                          color: Colors.white,
                        ),

                        // Edit text
                        Flexible(
                          child: Container(
                            child: TextField(
                              style: TextStyle(
                                  color: Color(0xFF747FFC), fontSize: 15.0),
                              controller: textEditingController,
                              decoration: InputDecoration.collapsed(
                                hintText: 'Type your message...',
                                hintStyle: TextStyle(
                                  color: Color(0xFF747FFC),
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
                                FocusScope.of(context).unfocus();
                                if (textEditingController.text.trim() != "") {
                                  widgetProvider.addWidgets(SimpleMessage(
                                    message: textEditingController.text,
                                    isBot: false,
                                  ));
                                  baseProvider.initiateIntent(
                                      textEditingController.text);
                                } else {}
                              },
                              color: Color(0xFF747FFC),
                            ),
                          ),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5)),
                        color: Colors.white),
                  )
                ],
              );
            },
          ),
        ));
  }
}
