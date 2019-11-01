import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import './router.dart';
import '../styles/theme.dart';

class App extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        debugPaintSizeEnabled = false;
        return MaterialApp(
            title: '跨境通-代购',
            home: RouteConfig.initRouteName,
            routes: RouteConfig.router,
            theme: ThemeConfig.themeData()
        );
    }
}
