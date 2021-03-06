import 'package:flutter/material.dart';
import 'package:appfactory/utils.dart';

class FactoryModel extends ChangeNotifier {
  List<Factory> factories = [];
  bool errorAdd = false;

  void addFactory(Factory fac) {
    errorAdd = false;
    int pos = factories.indexWhere((ele) => ele.nit == fac.nit);
    print(pos);
    if (pos < 0) {
      factories.add(fac);
    } else
      errorAdd = true;
    notifyListeners();
  }

  void remove(int index) {
    factories.removeAt(index);
    notifyListeners();
  }

  int getPosition(Factory fac) {
    return factories.indexWhere((ele) => ele.nit == fac.nit);
  }

  void modifyFactory(Factory fac) {
    int pos = getPosition(fac);
    factories[pos] = fac;
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
