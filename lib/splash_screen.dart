import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodboy/blocs/base_bloc.dart';
import 'package:goodboy/blocs/base_bloc_state.dart';
import 'package:goodboy/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<BaseBloc, BaseBlocState>(
      listener: (BuildContext context, BaseBlocState state) {
        if (state is AppInitialized) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        }
      },
      child: Scaffold(
          body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "GoodBoy",
              style: TextStyle(color: Color(0xFF747FFC), fontSize: 32.0),
            ),
            Image.asset("assets/bot.png"),
          ],
        ),
      )),
    );
  }
}
