import 'package:flutter/material.dart';
import 'package:appfactory/utils.dart';

class FactoryModel extends ChangeNotifier {
  List<Factory> factories = [
    Factory(7837843, 'Coca Cola Company LTDA', 'Esto es una compania',
        'CRA 26J ', 'SFSFF.JPG', 3217118192)
  ];

  void addFactory(Factory fac) {
    factories.add(fac);
    notifyListeners();
  }

  /* Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  Item getByPosition(int position) {
    return getById(position);
  } */
}

@immutable
class Factory {
  final int nit;
  final String razonSocial;
  final int telefono;
  final String direccion;
  final String descripcion;
  final String logo;

  Factory(this.nit, this.razonSocial, this.descripcion, this.direccion,
      this.logo, this.telefono);
}
