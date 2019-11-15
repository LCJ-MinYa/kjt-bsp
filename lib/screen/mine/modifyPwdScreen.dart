import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/button/submitButton.dart';
import 'package:kjt_bsp/widget/cell/textFieldCellWidget.dart';

class ModifyPwdScreen extends StatefulWidget {
    @override
    _ModifyPwdScreenState createState() => _ModifyPwdScreenState();
}

class _ModifyPwdScreenState extends State<ModifyPwdScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('修改密码'),
            ),
            body: Column(
                children: <Widget>[
                    TextFieldCellWidget(
                        title: '旧密码',
                        hintText: '请输入密码',
                        isPwd: true,
                    ),
                    TextFieldCellWidget(
                        title: '新密码',
                        hintText: '请输入密码',
                        isPwd: true,
                    ),
                    TextFieldCellWidget(
                        title: '确认密码',
                        hintText: '请输入密码',
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