import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appfactory/utils.dart';

//Models Class
class AlertMsg extends StatefulWidget {
  final String msg;
  AlertMsg({Key? key, required this.msg}) : super(key: key);

  @override
  _AlertMsgState createState() => _AlertMsgState(this.msg);
}

class _AlertMsgState extends State<AlertMsg> {
  final String _msg;

  _AlertMsgState(this._msg);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: mediaQuery(context, 'h', .07),
        child: Column(children: [
          Row(children: [
            Expanded(
                child: Text(this._msg,
                    style: TextStyle(
                        fontFamily: 'Andika',
                        fontSize: mediaQuery(context, 'h', .018))))
          ])
        ]));
  }
}
