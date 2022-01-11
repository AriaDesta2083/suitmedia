import 'package:flutter/material.dart';
import 'package:suitmedia/theme.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key}) : super(key: key);

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
                backgroundColor: Colors.amber,
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
                  'Aria Desta Prabu',
                  style: myAppTextStyle,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Aria@Mail.com'.toUpperCase(),
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
