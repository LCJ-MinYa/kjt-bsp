import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import '../tap/platformTapWidget.dart';

class SubmitButton extends StatelessWidget {
    final bool disable;             //是否能点击 => 默认可以点击
    final Function onTap;           //点击事件
    final String title;             //标题 => 默认名称为确认
    final double width;             //宽度 => 默认宽度540
    final double height;            //高度 => 默认高度88

    SubmitButton({
        this.onTap,
        this.title = '确认',
        this.disable = false,
        this.width = 540,
        this.height = 88,
    });

    @override
    Widget build(BuildContext context) {
        return PlatformTapWidget(
            opacity: disable ? 1 : 0.7,
            onTap: onTap,
            child: Container(
                width: UISize.width(width),
                height: UISize.height(height),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(13, 154, 255, disable ? 0.3 : 1),
                    borderRadius: BorderRadius.all(Radius.circular(UISize.height(height/2)))
                ),
                child: Text(title, style: TextStyle(color: Colors.white, fontSize: UISize.size(30)),),
            ),
        ); 
    }
}