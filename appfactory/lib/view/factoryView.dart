import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appfactory/utils.dart';
import 'package:appfactory/model/factory.dart';
import 'package:provider/provider.dart';

import 'factoryNew.dart';

class DescFactory extends StatefulWidget {
  final int data;
  DescFactory({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  _DescFactoryState createState() => _DescFactoryState(this.data);
}

class _DescFactoryState extends State<DescFactory> {
  final int index;
  _DescFactoryState(this.index);

  void editFabric(Factory facx) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewFactory(data: facx)));
  }

  void remove() {
    Navigator.pushNamed(context, '/facList');
    Provider.of<FactoryModel>(context, listen: false).remove(index);
  }

  @override
  Widget build(BuildContext context) {
    Factory fac = Provider.of<FactoryModel>(context).factories[index];
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Color(0xFFf8fcff),
            width: mediaQuery(context, 'w', 1),
            height: mediaQuery(context, 'h', 1),
            padding: EdgeInsets.all(mediaQuery(context, 'w', .1)),
            child: Center(
              child: Container(
                height: mediaQuery(context, 'h', .8),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      height: mediaQuery(context, 'h', .2),
                      width: mediaQuery(context, 'w', .3),
                      child: CircleAvatar(),
                    )
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(fac.razonSocial,
                        style: TextStyle(
                            fontSize: mediaQuery(context, 'h', .025),
                            fontFamily: 'Andika'))
                  ]),
                  Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(children: [
                        Expanded(
                            flex: 3,
                            child: Text('Nit: ',
                                style: TextStyle(
                                    fontSize: mediaQuery(context, 'h', .02),
                                    fontFamily: 'Andika'))),
                        Expanded(
                            flex: 7,
                            child: Text(fac.nit.toString(),
                                style: TextStyle(
                                    fontSize: mediaQuery(context, 'h', .02),
                                    fontFamily: 'Andika')))
                      ])),
                  Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(children: [
                        Expanded(
                            flex: 3,
                            child: Text('Dir : ',
                                style: TextStyle(
                                    fontSize: mediaQuery(context, 'h', .02),
                                    fontFamily: 'Andika'))),
                        Expanded(
                            flex: 7,
                            child: Text(fac.direccion,
                                style: TextStyle(
                                    fontSize: mediaQuery(context, 'h', .02),
                                    fontFamily: 'Andika')))
                      ])),
                  Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(children: [
                        Expanded(
                            flex: 3,
                            child: Text('Tel: ',
                                style: TextStyle(
                                    fontSize: mediaQuery(context, 'h', .02),
                                    fontFamily: 'Andika'))),
                        Expanded(
                            flex: 7,
                            child: Text(fac.telefono.toString(),
                                style: TextStyle(
                                    fontSize: mediaQuery(context, 'h', .02),
                                    fontFamily: 'Andika')))
                      ])),
                  Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(children: [
                        Expanded(
                            child: Text('Descripción: ',
                                style: TextStyle(
                                    fontSize: mediaQuery(context, 'h', .02),
                                    fontFamily: 'Andika')))
                      ])),
                  Row(children: [
                    Expanded(
                        child: Container(
                      height: mediaQuery(context, 'h', .2),
                      child: Text(fac.descripcion,
                          style: TextStyle(
                              fontSize: mediaQuery(context, 'h', .02),
                              fontFamily: 'Andika')),
                    ))
                  ]),
                  Row(children: [
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: IconButton(
                            icon: Icon(CupertinoIcons.arrow_left),
                            onPressed: () => Navigator.pop(context),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: IconButton(
                            icon: Icon(
                              CupertinoIcons.pencil,
                              color: Colors.blue,
                            ),
                            onPressed: () => editFabric(fac),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: IconButton(
                            icon: Icon(CupertinoIcons.trash,
                                color: Colors.red[400]),
                            onPressed: () => remove(),
                          ),
                        ))
                  ])
                ]),
              ),
            )),
      ),
    );
  }
}
