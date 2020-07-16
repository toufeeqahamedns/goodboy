import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselMessage extends StatelessWidget {
  final List<dynamic> carouselList;

  CarouselMessage({this.carouselList});

  List<Widget> _buildCarousel(context) {
    List<Widget> widgets = [];

    carouselList.forEach((carouselElement) {
      widgets.add(Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: Image.network(carouselElement["image"]["imageUri"],
                    fit: BoxFit.fill, loadingBuilder: (BuildContext context,
                        Widget child, ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
              Text(carouselElement["title"])
            ],
          ),
        ),
      ));
    });

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
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
        Flexible(
          child: CarouselSlider(
            items: _buildCarousel(context),
            options: CarouselOptions(viewportFraction: 0.8),
          ),
        ),
      ],
    );
  }
}
