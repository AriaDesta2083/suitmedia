import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:suitmedia/models/users.dart';
import 'package:suitmedia/pages/third_screen/third_widget.dart';
import 'package:suitmedia/provider/data_provider.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late List<UserData> userdata;
  Future getUserData() async {
    var res = await http
        .get(Uri.parse('https://reqres.in/api/users?page=1&per_page=10'));
    var jsonData = jsonDecode(res.body);
    List<UserData> data = [];
    for (var u in jsonData['data']) {
      print(u['email']);
      UserData user = UserData(
          id: u['id'],
          email: u['email'].toString(),
          first_name: u['first_name'].toString(),
          last_name: u['last_name'].toString(),
          avatar: u['avatar'].toString());
      data.add(user);
    }
    print(data.length);
    return data;
  }

  @override
  void initState() {
    userdata = UserData.getItems();
    super.initState();
  }

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
          // child: ElevatedButton(
          //   onPressed: () {
          //     getUserData();
          //   },
          //   child: Text('tes'),
          // ),
          // child: FutureBuilder(
          //   future: getUserData(),
          //   builder: (context, snapshot) {
          //     if (snapshot == null) {
          //       return Container(
          //         child: Center(
          //           child: Text('loading...'),
          //         ),
          //       );
          //     } else {
          //       return ListView.builder(itemCount: snapshot.data.length,)
          //     }
          //   },
          // ),

          child: ListView(
            children: userdata
                .map(
                  (item) => CardItem(UserData(
                      id: item.id,
                      email: item.email,
                      first_name: item.first_name,
                      last_name: item.last_name,
                      avatar: item.avatar)),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
