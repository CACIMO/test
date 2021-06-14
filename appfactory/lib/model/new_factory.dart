import 'package:flutter/material.dart';
import 'package:appfactory/utils.dart';
import 'package:appfactory/model/factory.dart';
import 'package:provider/provider.dart';

class NewFactory extends StatefulWidget {
  NewFactory({Key? key}) : super(key: key);

  @override
  _NewFactoryState createState() => _NewFactoryState();
}

class _NewFactoryState extends State<NewFactory> {
  Map<String, TextEditingController> controller = {
    'nit': TextEditingController(),
    'rsl': TextEditingController(),
    'dir': TextEditingController(),
    'tel': TextEditingController(),
    'des': TextEditingController()
  };

  void cancelar() {
    controller.keys.forEach((key) {
      controller[key]!.text = '';
    });
    Navigator.pop(context);
  }

  void addNewFactory() {
    Provider.of<FactoryModel>(context, listen: false).addFactory(Factory(
        int.parse(controller['nit']!.text),
        controller['rsl']!.text,
        controller['des']!.text,
        controller['dir']!.text,
        'logo',
        int.parse(controller['tel']!.text)));

    cancelar();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: mediaQuery(context, 'h', .7),
        child: Column(children: [
          Row(children: [
            Container(
                padding: EdgeInsets.only(top: mediaQuery(context, 'h', .01)),
                child: Text('NIT',
                    style: TextStyle(
                        fontSize: mediaQuery(context, 'h', .015),
                        fontFamily: 'Andika')))
          ]),
          Row(children: [
            Container(
                width: mediaQuery(context, 'w', .6),
                child: TextField(
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: false, signed: false),
                    maxLength: 10,
                    controller: controller['nit'],
                    decoration: InputDecoration()))
          ]),
          Row(children: [
            Container(
                padding: EdgeInsets.only(top: mediaQuery(context, 'h', .01)),
                child: Text('Razón social',
                    style: TextStyle(
                        fontSize: mediaQuery(context, 'h', .015),
                        fontFamily: 'Andika')))
          ]),
          Row(children: [
            Container(
                width: mediaQuery(context, 'w', .6),
                child: TextField(
                    maxLength: 50,
                    controller: controller['rsl'],
                    decoration: InputDecoration()))
          ]),
          Row(children: [
            Container(
                padding: EdgeInsets.only(top: mediaQuery(context, 'h', .01)),
                child: Text('Dirección',
                    style: TextStyle(
                        fontSize: mediaQuery(context, 'h', .015),
                        fontFamily: 'Andika')))
          ]),
          Row(children: [
            Container(
                width: mediaQuery(context, 'w', .6),
                child: TextField(
                    maxLength: 30,
                    controller: controller['dir'],
                    decoration: InputDecoration()))
          ]),
          Row(children: [
            Container(
                padding: EdgeInsets.only(top: mediaQuery(context, 'h', .01)),
                child: Text('Telefono',
                    style: TextStyle(
                        fontSize: mediaQuery(context, 'h', .015),
                        fontFamily: 'Andika')))
          ]),
          Row(children: [
            Container(
                width: mediaQuery(context, 'w', .6),
                child: TextField(
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: false, signed: false),
                    maxLength: 10,
                    controller: controller['tel'],
                    decoration: InputDecoration()))
          ]),
          Row(children: [
            Container(
                padding: EdgeInsets.only(top: mediaQuery(context, 'h', .01)),
                child: Text('Descripción',
                    style: TextStyle(
                        fontSize: mediaQuery(context, 'h', .015),
                        fontFamily: 'Andika')))
          ]),
          Row(children: [
            Container(
                width: mediaQuery(context, 'w', .6),
                child: TextField(
                    maxLines: 5,
                    maxLength: 100,
                    controller: controller['des'],
                    decoration: InputDecoration()))
          ]),
          Row(children: [
            Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: () => cancelar(),
                      child: Text('Cancelar',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: mediaQuery(context, 'h', .015),
                              fontFamily: 'Andika'))),
                )),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () => addNewFactory(),
                      child: Text('Aceptar',
                          style: TextStyle(
                              fontSize: mediaQuery(context, 'h', .015),
                              fontFamily: 'Andika'))),
                ))
          ])
        ]));
  }
}
