import 'package:appfactory/view/login.dart';
import 'package:flutter/material.dart';
import 'package:appfactory/model/factory.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [Provider(create: (_) => FactoryModel())], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (_) => Login()},
      title: 'The Factory',
      //initialRoute: '/',
      //routes: {'/': (context) => Login()},
      //home: Login()
    );
  }
}
