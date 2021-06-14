import 'package:flutter/material.dart';
import 'package:appfactory/utils.dart';
import 'package:appfactory/model/factory.dart';

class DescFactory extends StatefulWidget {
  final Factory data;
  DescFactory({Key? key, required this.data}) : super(key: key);

  @override
  _DescFactoryState createState() => _DescFactoryState(this.data);
}

class _DescFactoryState extends State<DescFactory> {
  final Factory fac;
  _DescFactoryState(this.fac);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: mediaQuery(context, 'h', 7),
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
              height: mediaQuery(context, 'h', .23),
              child: Text(fac.descripcion,
                  style: TextStyle(
                      fontSize: mediaQuery(context, 'h', .02),
                      fontFamily: 'Andika')),
            ))
          ]),
          Row(children: [
            Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () => print('d'),
                      child: Text('Editar',
                          style: TextStyle(
                              fontSize: mediaQuery(context, 'h', .015),
                              fontFamily: 'Andika'))),
                )),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red[400]!)),
                      onPressed: () => print('d'),
                      child: Text('Eliminar',
                          style: TextStyle(
                              fontSize: mediaQuery(context, 'h', .015),
                              fontFamily: 'Andika'))),
                ))
          ])
        ]));
  }
}
