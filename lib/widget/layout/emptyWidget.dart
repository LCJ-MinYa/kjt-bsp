import 'package:flutter/material.dart';
import 'package:kjt_bsp/config/imgConfig.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/layout/autoAdaptiveAnimatedWidget.dart';

/* 空数据组件 */
class EmptyWidget extends StatelessWidget {
    final bool isShow;                  //是否显示

    EmptyWidget({
        @required this.isShow,
    });

    @override
    Widget build(BuildContext context) {

        return AutoAdaptiveAnimatedWidget(
            shouldCenter: false,
            isShow: isShow,
            children: <Widget>[
                SizedBox(height: UISize.width(100)),
                Container(
                    width: UISize.width(150),
                    height: UISize.width(150),
                    child: Image.asset(
                        ImgConfig.emptyData,
                        width: UISize.width(100),
                        height: UISize.width(100),
                        fit: BoxFit.cover,
                    ),
                ),
                SizedBox(height: UISize.width(20)),
                Container(
                    child: Text(
                        '没有更多数据...',
                        style: TextStyle(
                            color: Color(0xff666666),
                            fontSize: UISize.size(28)
                        ),
                    )
                ),
            ]
        );
    }
}