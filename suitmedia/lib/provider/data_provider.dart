import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:suitmedia/models/users.dart';

class DataProvider extends ChangeNotifier {
  getData() async {
    var res = await http
        .get(Uri.parse('https://reqres.in/api/users?page=1&per_page=10'));
    if (res.statusCode == 200) {
      Map<String, dynamic> map = json.decode(res.body);
      List<dynamic> data = map['data'];
      return data;
    } else {
      return null;
    }
  }
}
