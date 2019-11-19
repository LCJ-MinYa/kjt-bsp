import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kjt_bsp/common/androidBackDeakTop.dart';
import 'package:kjt_bsp/common/toast.dart';
import 'package:kjt_bsp/styles/uiSize.dart';

import '../main/mainScreen.dart';
import '../order/orderScreen.dart';
import '../mine/mineScreen.dart';

class TabNavScreen extends StatefulWidget {
    @override
    _TabNavScreenState createState() => _TabNavScreenState();
}

class _TabNavScreenState extends State<TabNavScreen> {
    DateTime lastPopTime;

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
    final List<Widget> _screenList = [
        MainScreen(),
        OrderScreen(),
        MineScreen()
    ];
    int _currentIndex = 0;
    PageController _pageController;

    @override
    void initState() {
        super.initState();
        _pageController = PageController(initialPage: _currentIndex);
    }

    @override
    Widget build(BuildContext context) {
        UISize.init(context);

        return WillPopScope(
            onWillPop: () async {
                // 点击返回键的操作
                if(lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: 2)){
                    lastPopTime = DateTime.now();
                    toast('再按一次退出APP');
                }else{
                    lastPopTime = DateTime.now();

                    //设置为返回不退出app
                    AndroidBackTop.backDeskTop();
                }
                return false;
            },
            child: Scaffold(
                body: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: _screenList,
                    // onPageChanged: (index){

                    // },
                ),
                bottomNavigationBar: BottomNavigationBar(
                    // selectedItemColor: Theme.of(context).primaryColorLight,
                    backgroundColor: Color(0xFFFAFAFA),
                    items: _bottomTabList,
                    currentIndex: _currentIndex,
                    onTap: _toggleTab,
                )
            ) 
        );
    }

    _toggleTab(index){
        setState(() {
            _currentIndex = index; //控制底部导航按钮选择状态，不能省略
            _pageController.jumpToPage(_currentIndex);
        });
    }
}