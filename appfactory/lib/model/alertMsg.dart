import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appfactory/utils.dart';

//Models Class
class AlertMsg extends StatelessWidget {
  final String msg;
  AlertMsg({Key? key, required this.msg}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
        height: mediaQuery(context, 'h', .07),
        child: Column(children: [
          Row(children: [
            Expanded(
                child: Text(this.msg,
                    style: TextStyle(
                        fontFamily: 'Andika',
                        fontSize: mediaQuery(context, 'h', .018))))
          ])
        ]));
  }
}
