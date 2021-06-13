import 'package:appfactory/view/login.dart';
import 'package:flutter/material.dart';
import 'package:appfactory/model/factory.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (context) => FactoryModel())],
      child: MaterialApp(
        title: 'The Factory',
        initialRoute: '/',
        routes: {'/': (context) => Login()},
      ),
    );
  }
}
