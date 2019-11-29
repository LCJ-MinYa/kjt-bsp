import 'package:flutter/material.dart';
import 'package:kjt_bsp/widget/layout/autoAdaptiveWidget.dart';

/*
 * 带有动画自适应组件
 */
class AutoAdaptiveAnimatedWidget extends StatelessWidget {
    final bool isShow;                  //是否显示
    final List<Widget> children;        //组件列表
        final bool shouldCenter;

    AutoAdaptiveAnimatedWidget({
        @required this.isShow,
        @required this.children,
        this.shouldCenter = true,
    });

    @override
    Widget build(BuildContext context) {
        return AnimatedOpacity(
            opacity: isShow ? 1 : 0,
            duration: Duration(milliseconds: 300),
            child: AutoAdaptiveWidget(
                shouldCenter: shouldCenter,
                children: children,
            ),
        );
    }
}