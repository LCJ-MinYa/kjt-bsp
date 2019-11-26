import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';

class TitleWithNameWidget extends StatelessWidget {
    final String title;

    TitleWithNameWidget({
        @required this.title,
    });

    @override
    Widget build(BuildContext context) {
        return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: UISize.width(32)),
            width: double.infinity,
            height: UISize.height(96),
            child: Text(
                title,
                style: TextStyle(
                    fontSize: UISize.size(26),
                    color: Color(0xff333333)
                ),
            ),
        );
    }
}