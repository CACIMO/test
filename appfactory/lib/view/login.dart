import 'package:flutter/material.dart';
import 'package:appfactory/utils.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                                child: TextField(decoration: InputDecoration()))
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
                                        onPressed: () {},
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
