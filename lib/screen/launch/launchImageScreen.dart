import 'package:flutter/material.dart';

class LaunchImageScreen extends StatefulWidget {
    @override
    _LaunchImageScreenState createState() => _LaunchImageScreenState();
}

class _LaunchImageScreenState extends State<LaunchImageScreen> {
    @override
    void initState() {
        super.initState();
        _startHome();
    }

    @override
    Widget build(BuildContext context) {
        return Container(width: 0, height: 0);
    }

    //显示2秒后跳转到HomeTabPage
    _startHome() async {
        await Future.delayed(const Duration(milliseconds: 2000), () {
            Navigator.pushReplacementNamed(context, '/tabbar');
        });
    }
}