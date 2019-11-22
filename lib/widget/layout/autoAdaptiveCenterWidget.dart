import 'package:flutter/material.dart';

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