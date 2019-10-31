import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

import '../screen/tabbar/tabNavScreen.dart';
import '../screen/mine/mineMessageScreen.dart';
import '../screen/mine/aboutUsScreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp(
      title: '跨境通-代购',
      home: TabNavScreen(),
      routes: <String, WidgetBuilder>{
        './': (BuildContext context) => TabNavScreen(),
        '/mineMessage': (BuildContext context) => MineMessageScreen(),
        '/aboutUs': (BuildContext context) => AboutUsScreen(),
      },
      theme: ThemeData(
        buttonColor: Color(0xff0d9aff), //按钮背景颜色
        accentTextTheme: TextTheme(
            //默认文本样式
            title: TextStyle(color: Color(0xff0d9aff), fontSize: 14.0)),
        splashColor: Colors.white,
        primaryColor: Colors.white,
        primaryColorLight: Color(0xff0d9aff),
      ),
    );
  }
}
