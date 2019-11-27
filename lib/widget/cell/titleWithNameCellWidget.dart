import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/cell/containerCellWidget.dart';

class TitleWithNameCellWidget extends StatelessWidget {
    final String title;

    TitleWithNameCellWidget({
        @required this.title,
    });

    @override
    Widget build(BuildContext context) {
        return ContainerCellWidget(
            bgColor: Color(0x00ffffff),
            align: Alignment.centerLeft,
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