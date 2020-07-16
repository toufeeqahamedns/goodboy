import 'dart:io';

import 'package:flutter/material.dart';

class ImageMessage extends StatelessWidget {
  final File image;

  ImageMessage({this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Flexible(
            child: Card(
              color: Color(0xFFB5B9EB),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(image),
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
}