import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import '../tap/platformTapWidget.dart';

/* listTitle封装 */
class NameCellWidget extends StatelessWidget {
    final Function onTap;           //是否能点击，点击事件
    final String title;             //标题
    final String value;             //对应值
    final Color bgColor;            //背景颜色 =>默认白色
    final bool showArrow;           //是否显示右侧箭头 =>默认显示
    final double height;            //自定义高度 => 默认48dp
    final double borderRadius;      //是否有圆角 => 默认无圆角
    final bool showBottomBorder;    //是否显示底部边框 => 默认显示

    NameCellWidget({
        this.onTap,
        this.title,
        this.bgColor = Colors.white,
        this.showArrow = true,
        @required this.value,
        this.height = 96,
        this.borderRadius = 0,
        this.showBottomBorder = true,
    });

    Widget _nameCellWidget(){
        return Container(
            padding: EdgeInsets.only(left: UISize.width(32)),
            width: double.infinity,
            height: UISize.height(height),
            alignment: Alignment(0, 0),
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(Radius.circular(UISize.width(borderRadius))),
            ),
            child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: UISize.height(showBottomBorder ? 1 : 0),
                            color: Color(0xffe0e4e6),
                        ),
                    ),
                ),
                child: Row(
                    children: <Widget>[
                        title != null ? Container(
                            width: UISize.width(160),
                            height: double.infinity,
                            child: Text(
                                title,
                                style: TextStyle(
                                    fontSize: UISize.size(28),
                                    color: Color(0xff333333)
                                ),
                            ),
                            alignment: Alignment.centerLeft,
                        ) : Container(width: 0, height: 0),
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.only(right: UISize.width(32)),
                                height: double.infinity,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                        Text(
                                            value,
                                            style: TextStyle(
                                                color: Color(0xff333333),
                                                fontSize: UISize.size(28)
                                            ),
                                        ),
                                        showArrow ? Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Color(0xffB3B3B3)
                                        ) : Container(width: 0, height: 0),     
                                    ],
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        if(onTap != null){
            return PlatformTapWidget(
                onTap: onTap,
                child: _nameCellWidget(),
            );
        }else{
            return _nameCellWidget();
        }
    }
}