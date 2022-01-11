import 'package:flutter/material.dart';
import 'package:suitmedia/pages/first_screen/first_widget.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: 116,
                  width: 116,
                  child: Image.asset(
                    'assets/btn_add_photo .png',
                  ),
                ),
                SizedBox(
                  height: 58,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: MyForm(),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
