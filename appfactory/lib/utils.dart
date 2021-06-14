import 'dart:convert';

import 'package:appfactory/model/factory.dart';
import 'package:appfactory/model/factory_desc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appfactory/model/alertMsg.dart';
import 'package:appfactory/model/new_factory.dart';

String urlDB = 'localhost:3000';

double mediaQuery(BuildContext ctx, String direction, double scale) {
  double result = 0;
  MediaQueryData queryData = MediaQuery.of(ctx);

  switch (direction) {
    case 'w':
      result = queryData.size.width * (scale);
      break;
    case 'h':
      result = queryData.size.height * (scale);
      break;
  }
  return result;
}

Future httpGet(urlRoute) async {
  var urlData = Uri.http(urlDB, urlRoute);
  var response = await http.get(urlData, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else if (response.statusCode == 401) {
    return Future.error({'err': 'dataNull'});
  } else {
    return Future.error(jsonDecode(response.body));
  }
}

Future httpPost(urlRoute, Map<String, String>? data) async {
  var urlData = Uri.http(urlDB, urlRoute);
  var response = await http.post(urlData, body: data);
  if (response.statusCode == 200)
    return jsonDecode(response.body);
  else
    return Future.error(jsonDecode(response.body));
}

Future<void> alertMesage(BuildContext ctx, String title, String msgx) {
  return showDialog<void>(
      context: ctx,
      builder: (BuildContext context) {
        return new AlertDialog(
            title: Text(title,
                style: TextStyle(
                    fontFamily: 'Andika', fontSize: mediaQuery(ctx, 'h', .02))),
            content: AlertMsg(msg: msgx));
      });
}

Future<void> alertNewFactory(BuildContext ctx) {
  return showDialog<void>(
      context: ctx,
      builder: (BuildContext context) {
        return new AlertDialog(
            title: Text('Agregar Fabrica',
                style: TextStyle(
                    fontFamily: 'Andika', fontSize: mediaQuery(ctx, 'h', .02))),
            content: NewFactory());
      });
}

Future<void> alertDescFac(BuildContext ctx, Factory data) {
  return showDialog<void>(
      context: ctx,
      builder: (BuildContext context) {
        return new AlertDialog(
            content: DescFactory(
          data: data,
        ));
      });
}
