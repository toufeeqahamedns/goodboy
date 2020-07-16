import 'package:flutter/material.dart';

class ListMessage extends StatelessWidget {
  final String title;
  final List<dynamic> items;

  ListMessage({this.title, this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(title: Text(title)),
        ListView.builder(itemBuilder: (BuildContext context, int index) {
          return ListTile(
            subtitle: Text(items[index]["title"]),
          );
        },
        itemCount: items.length,
        shrinkWrap: true,),
      ],
    ));
  }
}
