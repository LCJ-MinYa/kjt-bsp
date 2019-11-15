import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';

class AppBarTextWidget extends StatelessWidget {
    final String title;

    AppBarTextWidget({
        @required this.title,
    });

    @override
    Widget build(BuildContext context) {
        return Text(
            title,
            style: TextStyle(
                fontSize: UISize.appBarFontSize()
            )
        );
    }
}
