import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';

/*
 * 适配文字大小的导航标题组件
 */
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
