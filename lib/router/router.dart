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
    static final initRouteName = '/';

    static final Map<String, WidgetBuilder> router = {
        '/': (BuildContext context) => TabNavScreen(),
        '/mineMessage': (BuildContext context) => MineMessageScreen(),
        '/aboutUs': (BuildContext context) => AboutUsScreen(),
        '/feedback': (BuildContext context) => FeedbackScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/forgetPwd': (BuildContext context) => ForgetPwdScreen(),
        '/setting': (BuildContext context) => SettingScreen(),
        '/modifyPwd': (BuildContext context) => ModifyPwdScreen(),
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