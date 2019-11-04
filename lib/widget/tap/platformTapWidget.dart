import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/* 自定义的tap,两端方案分开 */
class PlatformTapWidget extends StatelessWidget {
    final Function onTap;
    final Widget child;
    final double opacity;

    PlatformTapWidget({
        this.onTap,
        this.child,
        this.opacity = 0.7,
    });

    @override
    Widget build(BuildContext context) {
        return CupertinoButton(
            padding: EdgeInsets.all(0),
            pressedOpacity: opacity,
            child: child,
            onPressed: onTap,
        );
    }
}