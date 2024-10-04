import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(width: 160, color: Colors.red),
        Container(width: 160, color: Colors.blue),
        Container(width: 160, color: Colors.green),
        Container(width: 160, color: Colors.yellow),
        Container(width: 160, color: Colors.orange),
      ],
    );
  }
}
