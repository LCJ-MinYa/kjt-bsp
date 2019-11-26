import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './fadeRoute.dart';

import '../screen/launch/launchImageScreen.dart';

import '../screen/tabbar/tabNavScreen.dart';

import '../screen/mine/mineMessageScreen.dart';
import '../screen/mine/aboutUsScreen.dart';
import '../screen/mine/feedbackScreen.dart';
import '../screen/mine/settingScreen.dart';
import '../screen/mine/modifyPwdScreen.dart';

import '../screen/login/loginScreen.dart';
import '../screen/login/forgetPwdScreen.dart';

import '../screen/order/orderDetailScreen.dart';
import '../screen/order/orderEntryScreen.dart';

class RouteConfig{
    static final initRouteName = '/';

    static final Map<String, WidgetBuilder> router = {
        '/': (BuildContext context) => LaunchImageScreen(),
        '/tabbar': (BuildContext context) => TabNavScreen(),
        '/mineMessage': (BuildContext context) => MineMessageScreen(),
        '/aboutUs': (BuildContext context) => AboutUsScreen(),
        '/feedback': (BuildContext context) => FeedbackScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/forgetPwd': (BuildContext context) => ForgetPwdScreen(),
        '/setting': (BuildContext context) => SettingScreen(),
        '/modifyPwd': (BuildContext context) => ModifyPwdScreen(),
        '/orderDetail': (BuildContext context, {arguments}) => OrderDetailScreen(arguments: arguments),
        '/orderEntry': (BuildContext context) => OrderEntryScreen(),
    };

    static Route<dynamic> onGenerateRoute(RouteSettings settings){

        // 统一处理路由
        final String name = settings.name; 
        final Function pageContentBuilder = router[name];

        //定义当前需要返回得route对象
        Route route;
        if (pageContentBuilder != null) {
            if (settings.arguments != null) {
                //带参数的处理方式
                switch(name){
                    default:
                        route = CupertinoPageRoute(
                            builder: (context) => pageContentBuilder(context, arguments: settings.arguments)
                        );
                        break;
                }
            }else{
                //不带参数的处理方式
                switch(name){
                    case '/':
                    // case '/tabbar':
                        route = FadeRoute(
                            builder: (context) => pageContentBuilder(context),
                        );
                        break;  
                    case '/login':
                        route = CupertinoPageRoute(
                            builder: (context) => pageContentBuilder(context),
                            fullscreenDialog: true
                        );
                        break;
                    default:
                        route = CupertinoPageRoute(
                            builder: (context) => pageContentBuilder(context)
                        );
                        break;
                }
            }
        }
        return route;
    }
}