import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('tasktask'),
      leading: Container(
        width: 80,
        height: 80,
        child: FlatButton(
          onPressed: () {},
          child: Icon(
            Icons.accessibility,
            color: Colors.blue,
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
        ),
      ],
    ));
  }
}
