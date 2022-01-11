import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/pages/first_screen/first_page.dart';
import 'package:suitmedia/pages/second_screen/second_page.dart';
import 'package:suitmedia/pages/third_screen/third_page.dart';
import 'package:suitmedia/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      theme: mytheme(),
    );
  }
}
