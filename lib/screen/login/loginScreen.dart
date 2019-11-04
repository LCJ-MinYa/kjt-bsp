import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import '../../config/appConfig.dart';

class LoginScreen extends StatefulWidget {
    @override
    _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    @override
    Widget build(BuildContext context) {
        UISize.init(context);

        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: Scaffold(
                body: Column(
                    children: <Widget>[
                        Stack(
                            children: <Widget>[
                                AspectRatio(
                                    aspectRatio: 375/294,
                                    child: Image.asset(
                                        AppConfig.loginImgUrl + 'banner.png',
                                        fit: BoxFit.cover,
                                    ),
                                )
                            ],
                        ),
                    ],
                ),
            ),
        );
    }
}