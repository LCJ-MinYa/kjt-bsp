import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/cell/nameCellWidget.dart';

class SettingScreen extends StatefulWidget {
    @override
    _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
    @override
    Widget build(BuildContext context) {
        UISize.init(context);

        return Scaffold(
            appBar: AppBar(
                title: Text('设置'),
            ),
            body: Column(
                children: <Widget>[
                    NameCellWidget(
                        value: '修改密码',
                        onTap: (){
                            Navigator.pushNamed(context, '/modifyPwd');
                        },
                    ),
                    NameCellWidget(
                        showBottomBorder: false,
                        value: '清除缓存',
                        onTap: (){
                            Fluttertoast.showToast(
                                msg: "This is Center Short ToastThis is Center Short ToastThis is Center Short ToastThis is Center Short Toast",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                        },
                    ),
                    SizedBox(height: UISize.height(12)),
                    NameCellWidget(
                        value: '退出登录',
                        valueTextStyle: TextStyle(fontSize: UISize.size(28)),
                        showBottomBorder: false,
                        onTap: (){

                        },
                    ),
                ],
            ),
        );
    }
}