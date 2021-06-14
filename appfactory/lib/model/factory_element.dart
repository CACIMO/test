import 'package:appfactory/view/factoryView.dart';
import 'package:flutter/material.dart';
import 'package:appfactory/utils.dart';
import 'package:appfactory/model/factory.dart';
import 'package:provider/provider.dart';

class ItemFactory extends StatelessWidget {
  final Factory fac;
  const ItemFactory({Key? key, required this.fac}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: EdgeInsets.all(mediaQuery(context, 'w', .01)),
          child: Column(children: [
            Row(children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                    ),
                  )),
              Expanded(
                  flex: 8,
                  child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        Row(children: [
                          Expanded(
                              child: Text('${fac.razonSocial}',
                                  style: TextStyle(
                                      fontSize: mediaQuery(context, 'h', .02),
                                      fontFamily: 'Andika')))
                        ]),
                        Row(children: [
                          Expanded(
                              child: Text('NIT: ${fac.nit}',
                                  style: TextStyle(
                                      fontSize: mediaQuery(context, 'h', .015),
                                      fontFamily: 'Andika')))
                        ]),
                        Row(children: [
                          Expanded(
                              child: Text('Telefono: ${fac.telefono}',
                                  style: TextStyle(
                                      fontSize: mediaQuery(context, 'h', .015),
                                      fontFamily: 'Andika')))
                        ])
                      ])))
            ])
          ])),
      Divider()
    ]);
  }
}
