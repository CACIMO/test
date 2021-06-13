import 'package:flutter/material.dart';

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
