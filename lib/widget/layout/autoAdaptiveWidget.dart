import 'package:flutter/material.dart';

/*
 * 自适应组件
 */
class AutoAdaptiveWidget extends StatelessWidget {
    final bool shouldCenter;
    final List<Widget> children;

    AutoAdaptiveWidget({
        @required this.children,
        this.shouldCenter = true
    });

    @override
    Widget build(BuildContext context) {
        return Container(
            width: double.infinity,
            height: double.infinity,
            alignment: shouldCenter ? Alignment.center : Alignment.topCenter,
            child:  Column(
                mainAxisAlignment: shouldCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
                children: children,
            ),
        );
    }
}