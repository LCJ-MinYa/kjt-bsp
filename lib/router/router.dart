import 'package:flutter/material.dart';
import '../screen/tabbar/tabNavScreen.dart';

import '../screen/mine/mineMessageScreen.dart';
import '../screen/mine/aboutUsScreen.dart';
import '../screen/mine/feedbackScreen.dart';

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
                return MaterialPageRoute(
                    builder: (context) => TabNavScreen(),
                );
            case '/mineMessage':
                return MaterialPageRoute(
                    builder: (context) => MineMessageScreen(),
                );
            case '/aboutUs':
                return MaterialPageRoute(
                    builder: (context) => AboutUsScreen(),
                );
            case '/feedback':
                return MaterialPageRoute(
                    builder: (context) => FeedbackScreen(),
                );
            case '/login':
                return MaterialPageRoute(
                    builder: (context){
                        // print(settings);
                        return LoginScreen();
                    },
                    fullscreenDialog: true
                );
            case '/forgetPwd':
                return MaterialPageRoute(
                    builder: (context) => ForgetPwdScreen(),
                );
            default:
                return MaterialPageRoute(
                    builder: (context) => TabNavScreen(),
                );
        }
    }
}