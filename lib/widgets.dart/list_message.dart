import 'package:flutter/material.dart';

class ListMessage extends StatelessWidget {
  final String title;
  final List<dynamic> items;

  ListMessage({this.title, this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(child: Image.asset("assets/bot.png")),
        ),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
            children: <Widget>[
              Container(
                color: Color(0xFF747FFC),
                child: ListTile(
                    title: Text(
                  title,
                  style: TextStyle(fontSize: 24),
                )),
              ),
              ListView.builder(
                padding: const EdgeInsets.all(0.0),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text(items[index]["title"]));
                },
                itemCount: items.length,
                shrinkWrap: true,
              ),
            ],
          )),
        ),
        Spacer()
      ],
    );
  }
}
