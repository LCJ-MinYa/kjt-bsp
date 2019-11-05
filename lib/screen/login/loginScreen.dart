import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/button/submitButton.dart';
import 'package:kjt_bsp/widget/tap/platformTapWidget.dart';
import '../../config/appConfig.dart';

class LoginScreen extends StatefulWidget {
    @override
    _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    /* 顶部banner */
    Widget _bannerWidget(){
        return Stack(
            children: <Widget>[
                AspectRatio(
                    aspectRatio: 375/294,
                    child: Image.asset(
                        AppConfig.loginImgUrl + 'banner.png',
                        fit: BoxFit.cover,
                    ),
                ),
                Positioned(
                    width: UISize.width(60),
                    height: UISize.width(60),
                    left: UISize.width(20),
                    top: UISize.height(50),
                    child: PlatformTapWidget(
                        onTap: (){
                            Navigator.pop(context);
                        },
                        child: Icon(
                            Icons.close,
                            color: Colors.black,
                        ),
                    ),
                ),
            ],
        );
    }

    /* 登录框 */
    Widget _loginBoxWidget(iconName, hintText, isPwd){
        return Container(
            width: UISize.width(600),
            height: UISize.height(120),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: UISize.width(1),
                        color: Color(0xffd8d8d8)
                    ),
                ),
            ),
            child: Row(
                children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(right: UISize.width(32)),
                        width: UISize.width(40),
                        height: UISize.width(40),
                        child: Icon(
                            iconName,
                            color: Theme.of(context).primaryColor,
                            size: isPwd ? 22 : 24,
                        ),
                    ),
                    Expanded(
                        child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            alignment: Alignment.centerLeft,
                            child: TextField(
                                maxLength: 10,
                                decoration: InputDecoration(
                                    hintText: hintText,
                                    hintStyle: TextStyle(
                                        color: Color(0xffb3b3b3),
                                        fontSize: UISize.size(30)
                                    ),
                                    border: InputBorder.none,
                                    counterText: '',
                                ),
                                style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: UISize.size(30)
                                ),
                                cursorColor: Color(0xff333333),
                                obscureText: isPwd,
                            ),
                        )
                    )
                ],
            ),
        );
    }

    /* 忘记密码 */
    Widget _forgetPwdWidget(){
        return PlatformTapWidget(
            onTap: (){

            },
            child: Container(
                margin: EdgeInsets.only(top: UISize.height(10)),
                width: UISize.width(600),
                alignment: Alignment.centerRight,
                child: Text(
                    '忘记密码？',
                    style: TextStyle(
                        fontSize: UISize.size(24),
                        color: Color(0xffb3b3b3)
                    ),
                ),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        UISize.init(context);

        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: Scaffold(
                backgroundColor: Colors.white,
                body: Column(
                    children: <Widget>[
                        _bannerWidget(),
                        _loginBoxWidget(
                            Icons.person,
                            '请输入手机号',
                            false
                        ),
                        _loginBoxWidget(
                            Icons.lock,
                            '请输入密码',
                            true
                        ),
                        SizedBox(height: UISize.height(80)),
                        SubmitButton(
                            title: '登录',
                            onTap: (){

                            },
                            width: 600,
                        ),
                        _forgetPwdWidget(),
                    ],
                ),
            ),
        );
    }
}