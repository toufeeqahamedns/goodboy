import 'package:flutter/material.dart';
import 'package:goodboy/providers/base_provider.dart';
import 'package:goodboy/providers/message_provider.dart';
import 'package:goodboy/providers/widget_provider.dart';

import 'package:goodboy/splash_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodboy/blocs/base_bloc.dart';
import 'package:goodboy/blocs/base_bloc_event.dart';

import 'package:provider/provider.dart';
import 'package:goodboy/providers/dialofflow_provider.dart';
import 'package:goodboy/providers/googleAPIs_auth_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        Provider(
          create: (_) => GoogleAPIsAuthProvider(),
        ),
        ProxyProvider<GoogleAPIsAuthProvider, DialogFlowProvider>(
          update: (_, googleAPIsAuthProvider, __) => DialogFlowProvider(
              googleAPIsAuthProvider: googleAPIsAuthProvider),
        ),
        ChangeNotifierProvider(
          create: (_) => WidgetProvider(),
        ),
        Provider(create: (_) => MessageProvider()),
        ProxyProvider3<DialogFlowProvider, WidgetProvider, MessageProvider,
            BaseProvider>(
          update:
              (_, dialogFlowProvider, widgetProvider, messageProvider, __) =>
                  BaseProvider(
            dialogFlowProvider: dialogFlowProvider,
            widgetProvider: widgetProvider,
            messageProvider: messageProvider,
          ),
        )
      ],
      child: Consumer3(
        builder: (BuildContext context,
            GoogleAPIsAuthProvider googleAPIsAuthProvider,
            DialogFlowProvider dialogFlowProvider,
            BaseProvider baseProvider,
            Widget child) {
          return BlocProvider(
            create: (_) => BaseBloc(
              googleAPIsAuthProvider: googleAPIsAuthProvider,
              dialogFlowProvider: dialogFlowProvider,
              baseProvider: baseProvider,
            )..add(InitializeApp()),
            child: GoodBoy(),
          );
        },
      )));
}

class GoodBoy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFF747FFC),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
