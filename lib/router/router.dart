import 'package:flutter/material.dart';
import '../screen/tabbar/tabNavScreen.dart';
import '../screen/mine/mineMessageScreen.dart';
import '../screen/mine/aboutUsScreen.dart';
import '../screen/mine/feedbackScreen.dart';

class RouteConfig{
    static final Map<String, WidgetBuilder> router = {
        './': (BuildContext context) => TabNavScreen(),
        '/mineMessage': (BuildContext context) => MineMessageScreen(),
        '/aboutUs': (BuildContext context) => AboutUsScreen(),
        '/feedback': (BuildContext context) => FeedbackScreen(),
    };

    static final initRouteName = TabNavScreen();
}