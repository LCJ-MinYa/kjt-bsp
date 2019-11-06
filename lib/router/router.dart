import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screen/tabbar/tabNavScreen.dart';

import '../screen/mine/mineMessageScreen.dart';
import '../screen/mine/aboutUsScreen.dart';
import '../screen/mine/feedbackScreen.dart';
import '../screen/mine/settingScreen.dart';
import '../screen/mine/modifyPwdScreen.dart';

import '../screen/login/loginScreen.dart';
import '../screen/login/forgetPwdScreen.dart';

class RouteConfig{
    // static final Map<String, WidgetBuilder> router = {
    //     '/': (BuildContext context) => TabNavScreen(),
    //     '/mineMessage': (BuildContext context) => MineMessageScreen(),
    //     '/aboutUs': (BuildContext context) => AboutUsScreen(),
    //     '/feedback': (BuildContext context) => FeedbackScreen(),
    //     '/login': (BuildContext context) => LoginScreen(),
    // };

    static final initRouteName = '/';

    static Route<dynamic> onGenerateRouteConfig(RouteSettings settings){
        switch(settings.name){
            case '/':
                return CupertinoPageRoute(
                    builder: (context) => TabNavScreen(),
                );
            case '/mineMessage':
                return CupertinoPageRoute(
                    builder: (context) => MineMessageScreen(),
                );
            case '/aboutUs':
                return CupertinoPageRoute(
                    builder: (context) => AboutUsScreen(),
                );
            case '/feedback':
                return CupertinoPageRoute(
                    builder: (context) => FeedbackScreen(),
                );
            case '/login':
                return CupertinoPageRoute(
                    builder: (context){
                        // print(settings);
                        return LoginScreen();
                    },
                    fullscreenDialog: true
                );
            case '/forgetPwd':
                return CupertinoPageRoute(
                    builder: (context) => ForgetPwdScreen(),
                );
            case '/setting':
                return CupertinoPageRoute(
                    builder: (context) => SettingScreen(),
                );
            case '/modifyPwd':
                return CupertinoPageRoute(
                    builder: (context) => ModifyPwdScreen(),
                );
            default:
                return CupertinoPageRoute(
                    builder: (context) => TabNavScreen(),
                );
        }
    }
}