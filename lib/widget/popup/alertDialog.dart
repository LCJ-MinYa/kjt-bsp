import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';

showAlertDialog(BuildContext context, String title, String content, Function confirmAction) {
    showDialog(
        context: context,
        builder: (BuildContext context){
            return CupertinoAlertDialog(
                title: Text(
                    title,
                    textScaleFactor: UISize.getTextScaleFactory(),
                    style: TextStyle(
                        fontSize: UISize.size(32),
                    ),
                ),
                content: Padding(
                    padding: EdgeInsets.only(top: UISize.width(5)),
                    child: Text(content),
                ),
                actions: <Widget>[
                    CupertinoDialogAction(
                        child: Text(
                            '取消',
                            textScaleFactor: UISize.getTextScaleFactory(),
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
                            textScaleFactor: UISize.getTextScaleFactory(),
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