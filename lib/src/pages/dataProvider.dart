import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _DataProvider {
  List<dynamic> opciones = [];

  _DataProvider() {}

  Future<List> cargarDatos()async {
    final resp = await rootBundle.loadString('lib/data/cards.json');
      Map dataMap = jsonDecode(resp);
    return  opciones = dataMap['rutas'];
  }
}

final dataProvider = new _DataProvider();
