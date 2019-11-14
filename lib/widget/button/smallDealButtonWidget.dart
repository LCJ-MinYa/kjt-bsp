import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/tap/platformTapWidget.dart';

class SmallDealButtonWidget extends StatelessWidget {
    final String text;                          //按钮文本 => 必传
    final Color borderColor;                    //边框颜色 => 默认主题色
    final Color textColor;                      //按钮文本颜色 => 默认主题色
    final Color bgColor;                        //背景颜色 => 默认透明
    final Function onTap;                       //点击事件

    SmallDealButtonWidget({
        @required this.text,
        this.borderColor,
        this.textColor,
        this.bgColor = const Color(0x00ffffff),
        this.onTap
    });

    @override
    Widget build(BuildContext context) {
        return Container(
            width: UISize.width(96),
            height: UISize.width(48),
            padding: EdgeInsets.only(left: UISize.width(16)),
            child: PlatformTapWidget(
                onTap: onTap,
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: bgColor,
                        border: Border.all(
                            width: UISize.width(1),
                            color: borderColor != null ? borderColor : Theme.of(context).primaryColor
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(UISize.width(48)))
                    ),
                    child: Text(
                        text,
                        style: TextStyle(
                            color: textColor != null ? textColor : Theme.of(context).primaryColor,
                            fontSize: UISize.size(24)
                        ),
                    ),
                ),
            )
        );
    }
}