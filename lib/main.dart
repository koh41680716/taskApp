import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {},
          child: Text('launchscreen'),
        ),
      ),
    );
  }
}
