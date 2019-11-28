import 'package:flutter/material.dart';

/*
 * 带有动画自适应剧中组件
 */
class AutoAdaptiveCenterWidget extends StatelessWidget {
    final List<Widget> children;

    AutoAdaptiveCenterWidget({
        @required this.children,
    });

    @override
    Widget build(BuildContext context) {
        return Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
                child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children,
                ),
            ),
        );
    }
}