import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _InterviewProvider {
  List<dynamic> options = [];

  _InterviewProvider() {
    //_loadData();
  }

  Future<List<dynamic>> loadData() async{

    final rsp = await rootBundle.loadString('data/interview_opts.json');

    Map dataMap = json.decode(rsp);
    options = dataMap['options'];

    return options;
  }
}

final interviewProvider = new _InterviewProvider();