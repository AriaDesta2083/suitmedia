import 'package:flutter/material.dart';
import 'package:suitmedia/models/users.dart';
import 'package:suitmedia/theme.dart';

class CardItem extends StatelessWidget {
  final UserData user;
  CardItem(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: BorderDirectional(bottom: BorderSide(color: shadowColor))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Row(
          children: [
            SizedBox(
              height: 49,
              width: 49,
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.first_name + ' ' + user.last_name,
                  style: myAppTextStyle,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  user.email,
                  style: myButtonTextStyle.copyWith(
                      color: Color(0xFF686777), fontSize: 11),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
