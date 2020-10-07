import 'package:flutter/material.dart';
import 'ui/thema.dart';
import 'ui/screen/top/top_main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeData,
        initialRoute: '/top',
        routes: <String, WidgetBuilder>{'/top': (context) => TopMainScreen()});
  }
}
