import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import './router.dart';
import '../styles/theme.dart';

class App extends StatefulWidget {
    @override
    _AppState createState() => _AppState();
}

class _AppState extends State<App> {
    @override
    void initState() {
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        debugPaintSizeEnabled = false;
        return MaterialApp(
            title: '跨境通-代购',
            initialRoute: RouteConfig.initRouteName,
            theme: ThemeConfig.themeData(),
            onGenerateRoute: RouteConfig.onGenerateRoute,
        );
    }
}
