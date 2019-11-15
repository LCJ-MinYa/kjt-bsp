import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/button/submitButton.dart';
import 'package:kjt_bsp/widget/cell/textFieldCellWidget.dart';

class ForgetPwdScreen extends StatefulWidget {
    @override
    _ForgetPwdScreenState createState() => _ForgetPwdScreenState();
}

class _ForgetPwdScreenState extends State<ForgetPwdScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('忘记密码'),
            ),
            body: Column(
                children: <Widget>[
                    TextFieldCellWidget(
                        title: '手机号',
                        hintText: '请输入手机号',
                        maxLength: 11,
                        keyboardType: TextInputType.number,
                    ),
                    TextFieldCellWidget(
                        title: '验证码',
                        hintText: '请输入短信验证码',
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                    ),
                    TextFieldCellWidget(
                        title: '新密码',
                        hintText: '请输入新的密码',
                        isPwd: true,
                    ),
                    Expanded(
                        child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                                Positioned(
                                    bottom: UISize.height(60),
                                    child: SubmitButton(
                                        onTap: (){},
                                    )
                                ),
                            ],
                        ),
                    )
                ],
            ),
            resizeToAvoidBottomPadding: false,
        );
    }
}