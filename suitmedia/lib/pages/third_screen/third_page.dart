import 'package:flutter/material.dart';
import 'package:suitmedia/pages/third_screen/third_widget.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            padding: EdgeInsets.only(left: 28.5),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text('Third Screen'),
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(left: 20, bottom: 62),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          children: [for (var i = 0; i < 10; i++) CardItem()],
        ),
      )),
    );
  }
}
