import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appfactory/utils.dart';
import 'package:appfactory/model/factory_element.dart';
import 'package:appfactory/model/factory.dart';
import 'package:provider/provider.dart';

class FactoryList extends StatefulWidget {
  FactoryList({Key? key}) : super(key: key);

  @override
  _FactoryListState createState() => _FactoryListState();
}

class _FactoryListState extends State<FactoryList> {
  void openAlertNewFactory(BuildContext ctx) {
    alertNewFactory(ctx);
  }

  @override
  Widget build(BuildContext context) {
    List<Factory> factories = [];
    factories = Provider.of<FactoryModel>(context).factories;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              color: Color(0xFFf8fcff),
              width: mediaQuery(context, 'w', 1),
              height: mediaQuery(context, 'h', 1),
              padding: EdgeInsets.all(mediaQuery(context, 'w', .1)),
              child: Center(
                  child: Container(
                      color: Color(0xFFf8fcff),
                      height: mediaQuery(context, 'h', .8),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Listado de Fabricas',
                                  style: TextStyle(
                                      fontSize: mediaQuery(context, 'h', .035),
                                      fontFamily: 'Andika'))
                            ]),
                        Divider(),
                        Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              padding: EdgeInsets.only(
                                  top: 0, bottom: 0, left: 5, right: 5),
                              itemCount: factories.length,
                              itemBuilder: (BuildContext ctx, int index) {
                                return ItemFactory(
                                  data: factories[index],
                                );
                              }),
                        )
                      ]))))),
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.add),
        onPressed: () => openAlertNewFactory(context),
      ),
    );
  }
}
