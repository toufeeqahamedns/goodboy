import 'package:flutter/material.dart';

void main() {
  runApp(GoodBoy());
}

class GoodBoy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("GoodBoy"),
        ),
      ),
    );
  }
}
