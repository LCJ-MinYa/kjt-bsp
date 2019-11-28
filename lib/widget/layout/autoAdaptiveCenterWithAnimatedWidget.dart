import 'package:flutter/material.dart';
import 'autoAdaptiveCenterWidget.dart';

/*
 * 自适应剧中组件
 */
class AutoAdaptiveCenterWithAnimatedWidget extends StatelessWidget {
    final bool isShow;                  //是否显示
    final List<Widget> children;        //组件列表

    AutoAdaptiveCenterWithAnimatedWidget({
        @required this.isShow,
        @required this.children
    });

    @override
    Widget build(BuildContext context) {
        return AnimatedOpacity(
            opacity: isShow ? 1 : 0,
            duration: Duration(milliseconds: 300),
            child: AutoAdaptiveCenterWidget(
                children: children,
            ),
        );
    }
}