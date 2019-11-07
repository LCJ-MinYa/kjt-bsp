import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';

showAlertDialog(BuildContext context, String title, String content, Function confirmAction) {
    showDialog(
        context: context,
        builder: (BuildContext context){
            return CupertinoAlertDialog(
                title: Text(title),
                content: Text(content),
                actions: <Widget>[
                    CupertinoDialogAction(
                        child: Text(
                            '取消',
                            style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: UISize.size(28)
                            ),
                        ),
                        onPressed: (){
                            Navigator.of(context).pop();
                        },
                    ),
                    CupertinoDialogAction(
                        child: Text(
                            '确认',
                            style: TextStyle(
                                fontSize: UISize.size(28)
                            ),
                        ),
                        onPressed: (){
                            confirmAction();
                            Navigator.of(context).pop();
                        },
                    ),
                ],
            );
        }
    );
}