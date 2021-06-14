import 'package:appfactory/view/factoryList.dart';
import 'package:appfactory/view/factoryNew.dart';
import 'package:appfactory/view/factoryView.dart';
import 'package:appfactory/view/login.dart';
import 'package:flutter/material.dart';
import 'package:appfactory/model/factory.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => FactoryModel())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/facList': (context) => FactoryList(),
        '/facNew': (context) => NewFactory(data: null),
      },
      title: 'The Factory',
    );
  }
}
