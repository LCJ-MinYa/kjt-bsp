import 'package:flutter/material.dart';
import 'package:kjt_bsp/config/imgConfig.dart';

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
        return Image.asset(
            ImgConfig.launch,
            fit: BoxFit.fill
        );
    }

    //显示2秒后跳转到HomeTabPage
    _startHome() async {
        await Future.delayed(const Duration(milliseconds: 2000), () {
            Navigator.pushReplacementNamed(context, '/tabbar');
        });
    }
}