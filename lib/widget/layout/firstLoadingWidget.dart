import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/layout/autoAdaptiveWidget.dart';

/* 首次加载动画组件 */
class FirstLoadingWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return AutoAdaptiveWidget(
            children: <Widget>[
                Container(
                    width: UISize.width(100),
                    height: UISize.width(100),
                    child: SpinKitPouringHourglass(
                        color: Color(0xff757575),
                        size: UISize.size(70),
                        
                    ),
                ),
                Container(
                    child: Text(
                        '加载中...',
                        style: TextStyle(
                            color: Color(0xff666666),
                            fontSize: UISize.size(28)
                        ),
                    )
                ),
            ],
        );
    }
}