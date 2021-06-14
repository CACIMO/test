import 'package:flutter/material.dart';
import 'package:appfactory/utils.dart';
import 'package:appfactory/model/factory.dart';
import 'package:provider/provider.dart';

class NewFactory extends StatefulWidget {
  final Factory? data;
  NewFactory({Key? key, required this.data}) : super(key: key);

  @override
  _NewFactoryState createState() => _NewFactoryState(this.data);
}

class _NewFactoryState extends State<NewFactory> {
  final Factory? fac;
  _NewFactoryState(this.fac);

  Map<String, TextEditingController> controller = {
    'nit': TextEditingController(),
    'rsl': TextEditingController(),
    'dir': TextEditingController(),
    'tel': TextEditingController(),
    'des': TextEditingController()
  };

  bool edit = false;

  @override
  void initState() {
    super.initState();
    if (this.fac != null)
      setState(() {
        edit = true;
      });
  }

  void cancelar() {
    controller.keys.forEach((key) {
      controller[key]!.text = '';
    });
    Navigator.pop(context);
  }

  void addNewFactory() {
    if (!edit) {
      Provider.of<FactoryModel>(context, listen: false).addFactory(Factory(
          int.parse(controller['nit']!.text),
          controller['rsl']!.text,
          controller['des']!.text,
          controller['dir']!.text,
          'logo',
          int.parse(controller['tel']!.text)));

      if (Provider.of<FactoryModel>(context, listen: false).errorAdd) {
        alertMesage(context, 'Error', 'La empresa ya exisite.')
            .then((value) => cancelar());
      } else
        cancelar();
    } else {
      Provider.of<FactoryModel>(context, listen: false).modifyFactory(Factory(
          int.parse(controller['nit']!.text),
          controller['rsl']!.text,
          controller['des']!.text,
          controller['dir']!.text,
          'logo',
          int.parse(controller['tel']!.text)));

      cancelar();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (fac != null) {
      controller['nit']!.text = this.fac!.nit.toString();
      controller['tel']!.text = this.fac!.telefono.toString();
      controller['des']!.text = this.fac!.descripcion;
      controller['dir']!.text = this.fac!.direccion;
      controller['rsl']!.text = this.fac!.razonSocial;
    }
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
                    Text('${fac == null ? 'Agregar' : 'Modificar'} Fabrica',
                        style: TextStyle(
                            fontSize: mediaQuery(context, 'h', .035),
                            fontFamily: 'Andika'))
                  ]),
                  Divider(),
                  Row(children: [
                    Container(
                        padding:
                            EdgeInsets.only(top: mediaQuery(context, 'h', .01)),
                        child: Text('NIT',
                            style: TextStyle(
                                fontSize: mediaQuery(context, 'h', .015),
                                fontFamily: 'Andika')))
                  ]),
                  Row(children: [
                    Container(
                        width: mediaQuery(context, 'w', .8),
                        child: TextField(
                            enabled: !edit,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            maxLength: 10,
                            controller: controller['nit'],
                            decoration: InputDecoration()))
                  ]),
                  Row(children: [
                    Container(
                        padding:
                            EdgeInsets.only(top: mediaQuery(context, 'h', .01)),
                        child: Text('Razón social',
                            style: TextStyle(
                                fontSize: mediaQuery(context, 'h', .015),
                                fontFamily: 'Andika')))
                  ]),
                  Row(children: [
                    Container(
                        width: mediaQuery(context, 'w', .8),
                        child: TextField(
                            maxLength: 50,
                            controller: controller['rsl'],
                            decoration: InputDecoration()))
                  ]),
                  Row(children: [
                    Container(
                        padding:
                            EdgeInsets.only(top: mediaQuery(context, 'h', .01)),
                        child: Text('Dirección',
                            style: TextStyle(
                                fontSize: mediaQuery(context, 'h', .015),
                                fontFamily: 'Andika')))
                  ]),
                  Row(children: [
                    Container(
                        width: mediaQuery(context, 'w', .8),
                        child: TextField(
                            maxLength: 30,
                            controller: controller['dir'],
                            decoration: InputDecoration()))
                  ]),
                  Row(children: [
                    Container(
                        padding:
                            EdgeInsets.only(top: mediaQuery(context, 'h', .01)),
                        child: Text('Telefono',
                            style: TextStyle(
                                fontSize: mediaQuery(context, 'h', .015),
                                fontFamily: 'Andika')))
                  ]),
                  Row(children: [
                    Container(
                        width: mediaQuery(context, 'w', .8),
                        child: TextField(
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            maxLength: 10,
                            controller: controller['tel'],
                            decoration: InputDecoration()))
                  ]),
                  Row(children: [
                    Container(
                        padding:
                            EdgeInsets.only(top: mediaQuery(context, 'h', .01)),
                        child: Text('Descripción',
                            style: TextStyle(
                                fontSize: mediaQuery(context, 'h', .015),
                                fontFamily: 'Andika')))
                  ]),
                  Row(children: [
                    Container(
                        width: mediaQuery(context, 'w', .8),
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
                                      MaterialStateProperty.all<Color>(
                                          Colors.white)),
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
                ]),
              ),
            )),
      ),
    );
  }
}
