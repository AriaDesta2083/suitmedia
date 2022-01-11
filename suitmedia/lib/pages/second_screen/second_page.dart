import 'package:flutter/material.dart';
import 'package:suitmedia/pages/third_screen/third_page.dart';
import 'package:suitmedia/theme.dart';

class SecondPage extends StatefulWidget {
  final String name;
  const SecondPage(this.name, {Key? key}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
        title: Text('Second Screen'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: myAppTextStyle.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 12),
                ),
                Text(widget.name, style: myAppTextStyle),
                Spacer(),
                Center(
                  child: Text(
                    'Selected User Name',
                    style: myAppTextStyle.copyWith(fontSize: 24),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    //! PUSH
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ThirdPage()));
                  },
                  child: Text('Choose a User'),
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    fixedSize: Size(double.maxFinite, 41),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
