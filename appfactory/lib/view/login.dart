import 'package:flutter/material.dart';
import 'package:appfactory/utils.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool login() {
    bool resp = false;

    httpPost('login/noData', {'user': _user.text, 'pwd': _pass.text})
        .then((data) {
      alertMesage(context, 'Login Exitoso', 'Usuario Logueado Exitosamente.');
    }).catchError((onError) {
      String msg = 'Error en el servidor';
      if (onError['err'] == 'dataNull') msg = 'Datos del usurio incorrectos';
      alertMesage(context, 'Login Fallido', msg);
    });
    return resp;
  }

  @override
  Widget build(BuildContext context) {
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
                        height: mediaQuery(context, 'h', .6),
                        child: Column(children: [
                          Row(children: [
                            Text('Login',
                                style: TextStyle(
                                    fontSize: mediaQuery(context, 'h', .04),
                                    fontFamily: 'Andika'))
                          ]),
                          Row(children: [
                            Container(
                                padding: EdgeInsets.only(
                                    top: mediaQuery(context, 'h', .05)),
                                child: Text('Usuario',
                                    style: TextStyle(
                                        fontSize:
                                            mediaQuery(context, 'h', .015),
                                        fontFamily: 'Andika')))
                          ]),
                          Row(children: [
                            Container(
                                width: mediaQuery(context, 'w', .8),
                                child: TextField(
                                    controller: _user,
                                    decoration: InputDecoration()))
                          ]),
                          Row(children: [
                            Container(
                                padding: EdgeInsets.only(
                                    top: mediaQuery(context, 'h', .05)),
                                child: Text('Contraseña',
                                    style: TextStyle(
                                        fontSize:
                                            mediaQuery(context, 'h', .015),
                                        fontFamily: 'Andika')))
                          ]),
                          Row(children: [
                            Container(
                                width: mediaQuery(context, 'w', .8),
                                child: TextField(
                                    controller: _pass,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    obscureText: true,
                                    decoration: InputDecoration()))
                          ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(
                                        top: mediaQuery(context, 'w', .1)),
                                    child: ElevatedButton(
                                        onPressed: () => login(),
                                        child: Text('Iniciar Sesión',
                                            style: TextStyle(
                                                fontSize: mediaQuery(
                                                    context, 'h', .015),
                                                fontFamily: 'Andika'))))
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  width: mediaQuery(context, 'w', .6),
                                  image:
                                      AssetImage('resources/images/9859.jpg'))
                            ],
                          )
                        ]))))));
  }
}
