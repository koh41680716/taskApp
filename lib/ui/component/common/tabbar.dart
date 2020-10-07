//

import '../../../ui/thema.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Tabbar extends StatefulWidget {
  // ▲
  final String tabbarSelected;
  final parentContext;
  final StreamController streamController;
  static String tabbarSelectedHome = 'tabbarSelectedHome';
  static String tabbarSelectedTimer = 'tabbarSelectedTimer';
  static String tabbarSelectedMyHistory = 'tabbarSelectedMyHistory';
  static String tabbarSelectedFriends = 'tabbarSelectedFriends';

  Tabbar({this.tabbarSelected, this.parentContext, this.streamController});

  @override
  _Tabbar createState() => _Tabbar(
      tabbarSelected: this.tabbarSelected,
      parentContext: this.parentContext,
      streamController: this.streamController);
}

class _Tabbar extends State<Tabbar> {
  final String tabbarSelected;
  final parentContext;
  final StreamController streamController;
  int _selectedIndex = 0;
  var _bottomNavigationBarItems;

  _Tabbar({this.tabbarSelected, this.parentContext, this.streamController});

  StreamSink<String> sink;

  // アイコン情報　imageiconでカスタムアイコンにしている
  final Map _footerIcons = {
    'Home': Icon(
      Icons.home,
      color: Colors.blue,
    ),
    'Timer': Icon(
      Icons.timer,
      color: Colors.blue,
    ),
    'History': Icon(
      Icons.date_range,
      color: Colors.blue,
    ),
    'firends': Icon(
      Icons.favorite_border,
      color: Colors.blue,
    ),
  };
  // アイコン順番
  final List _footerItemOrder = ['Home', 'Timer', 'History', 'firends'];

// ？
  @override
  void initState() {
    super.initState();
    _bottomNavigationBarItems = <BottomNavigationBarItem>[];
    initSelectedIndex();
    for (var i = 0; i < _footerItemOrder.length; i++) {
      _bottomNavigationBarItems.add(_createIcon(_footerItemOrder[i]));
    }
// ▲
    sink = streamController.sink;
  }

  //  iconをImageIcon指定　Map _footerIconsを呼び出して作
  BottomNavigationBarItem _createIcon(String key) {
    return BottomNavigationBarItem(icon: _footerIcons[key], title: Text(key));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        sink.add('Home');
      } else if (_selectedIndex == 1) {
        sink.add('Timer');
      } else if (_selectedIndex == 2) {
        sink.add('History');
      } else if (_selectedIndex == 3) {
        sink.add('firends');
      }
    });
  }

  //  ボタンが押されたときのcolor指定など、BottomNavigationBar作成
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: themeData.primaryColor,
      items: _bottomNavigationBarItems,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white30,
    );
  }

  void initSelectedIndex() {
    if (tabbarSelected == Tabbar.tabbarSelectedHome) {
      _selectedIndex = 0;
    } else if (tabbarSelected == Tabbar.tabbarSelectedTimer) {
      _selectedIndex = 1;
    } else if (tabbarSelected == Tabbar.tabbarSelectedMyHistory) {
      _selectedIndex = 2;
    } else if (tabbarSelected == Tabbar.tabbarSelectedFriends) {
      _selectedIndex = 3;
    }
  }
}
