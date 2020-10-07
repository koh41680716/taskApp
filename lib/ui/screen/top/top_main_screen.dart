import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_app/ui/component/body/top_main_body.dart';
import 'package:task_app/ui/component/common/navigation.dart';
import 'package:task_app/ui/component/common/tabbar.dart';

class TopMainScreen extends StatefulWidget {
  @override
  _TopMainScreen createState() => _TopMainScreen();
}

class _TopMainScreen extends State<TopMainScreen>
    with SingleTickerProviderStateMixin {
  // ▲
  Stream<String> stream2;
  final _stremaController2 = StreamController<String>();

  @override
  void initState() {
    super.initState();
    stream2 = _stremaController2.stream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: 'Home',
        stream: stream2,
        builder: (BuildContext context, AsyncSnapshot<Object> snapShot) {
          String titleText = snapShot.data;
          return Scaffold(
            appBar: NavigationBar(),
            body: bodyController(titleText),
            bottomNavigationBar: Tabbar(
                tabbarSelected: Tabbar.tabbarSelectedHome,
                parentContext: context,
                streamController: _stremaController2),
          );
        });
  }

  Widget bodyController(String title) {
    if (title == 'Home') {
      return TopMainScreen();
    } else if (title == 'Timer') {
      return TopMainScreen();
    } else if (title == 'History') {
      return TopMainScreen();
    } else if (title == 'firends') {
      return TopMainScreen();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _stremaController2.close();
  }
}
