import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/tap/platformTapWidget.dart';

/*
 * 导航条右侧文本按钮组件
 */
class NavigatorRightButtonWidget extends StatelessWidget {
    final Function onTap;           //点击方法
    final String text;              //按钮文本

    NavigatorRightButtonWidget({
        this.onTap,
        this.text
    });

    @override
    Widget build(BuildContext context) {
        return PlatformTapWidget(
            onTap: onTap,
            child: Padding(
                padding: EdgeInsets.only(left: UISize.width(32),right: UISize.width(32)),
                child: Text(
                    text,
                    style: TextStyle(
                        fontSize: UISize.size(30)
                    ),
                ),
            )
        );
    }
}