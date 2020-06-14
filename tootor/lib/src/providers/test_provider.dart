import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _TestProvider {
  List<dynamic> options = [];

  _TestProvider() {
    //_loadData();
  }

  Future<List<dynamic>> loadData() async{

    final rsp = await rootBundle.loadString('data/test_opts.json');

    Map dataMap = json.decode(rsp);
    options = dataMap['options'];

    return options;
  }
}

final testProvider = new _TestProvider();