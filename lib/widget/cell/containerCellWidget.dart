import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';

class ContainerCellWidget extends StatelessWidget {
    final Widget child;             //子组件，必须传递
    final double height;            //自定义高度 => 默认48dp
    final double borderRadius;      //是否有圆角 => 默认无圆角
    final Color bgColor;            //背景颜色 =>默认白色
    final Alignment align;          //对其方式 =>默认居中
    final bool needRightPadding;    //右边距是否需要 => 默认需要

    ContainerCellWidget({
        @required this.child,
        this.height = 96,
        this.bgColor = Colors.white,
        this.borderRadius = 0,
        this.align = Alignment.center,
        this.needRightPadding = true,
    });

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.only(
                left: UISize.width(32),
                right: UISize.width(needRightPadding ? 32 : 0),
            ),
            width: double.infinity,
            height: UISize.height(height),
            alignment: align,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(Radius.circular(UISize.width(borderRadius))),
            ),
            child: child
        );
    }
}