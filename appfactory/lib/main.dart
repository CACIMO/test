import 'package:appfactory/view/factoryList.dart';
import 'package:appfactory/view/login.dart';
import 'package:flutter/material.dart';
import 'package:appfactory/model/factory.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FactoryModel())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/facList': (context) => FactoryList()
      },
      title: 'The Factory',
    );
  }
}
