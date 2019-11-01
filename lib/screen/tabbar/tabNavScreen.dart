import 'package:flutter/material.dart';

import '../main/mainScreen.dart';
import '../order/orderScreen.dart';
import '../mine/mineScreen.dart';

class TabNavScreen extends StatefulWidget {
    @override
    _TabNavScreenState createState() => _TabNavScreenState();
}

class _TabNavScreenState extends State<TabNavScreen> {
    final List<BottomNavigationBarItem> _bottomTabList = [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页')
        ),BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            title: Text('订单')
        ),BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('我的')
        )
    ];
    final List _screenList = [
        MainScreen(),
        OrderScreen(),
        MineScreen()
    ];
    int _currentIndex = 0;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: _screenList[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                // selectedItemColor: Theme.of(context).primaryColorLight,
                backgroundColor: Color(0xFFFAFAFA),
                items: _bottomTabList,
                currentIndex: _currentIndex,
                onTap: _toggleTab,
            )
        );
    }

    _toggleTab(index){
        setState(() {
            this._currentIndex = index;
        });
    }
}