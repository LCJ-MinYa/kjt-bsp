import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import '../tap/platformTapWidget.dart';

/* listTitle封装 */
class ListTitleWidget extends StatelessWidget {
    final Function onTap;       //是否能点击，点击事件
    final String title;         //标题
    final Color bgColor;        //背景颜色 =>默认白色
    final bool showArrow;       //是否显示右侧箭头 =>默认显示
    final String iconName;      //左侧icon
    final double height;        //自定义高度 => 默认50dp
    final double borderRadius;  //是否有圆角 => 默认无圆角

    ListTitleWidget({Key key,
        this.onTap,
        @required this.title,
        this.bgColor,
        this.showArrow = true,
        @required this.iconName,
        this.height,
        this.borderRadius,
    }) : super(key: key);

    Widget _listTitleWidget(){
        return Container(
            width: double.infinity,
            height: height != null ? UISize.height(height) : UISize.height(100),
            alignment: Alignment(0, 0),
            decoration: BoxDecoration(
                color: bgColor != null ? bgColor : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(UISize.width(borderRadius != null ? borderRadius : 0))),
            ),
            child: Row(
                children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: UISize.width(32), right: UISize.width(32)),
                        padding: EdgeInsets.only(top: UISize.height(4)),
                        child: Image.asset(
                            iconName,
                            width: UISize.width(40),
                            height: UISize.width(40),
                        ),
                    ),
                    Expanded(
                        child: Container(
                            height: double.infinity,
                            padding: EdgeInsets.only(right: UISize.width(32)),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: UISize.height(1),
                                        color: Color(0xffe0e4e6),
                                    ),
                                ),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                    Text(
                                        title,
                                        style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: UISize.size(28)
                                        ),
                                    ),
                                    Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color(0xffB3B3B3),
                                    ),     
                                ],
                            ),
                        ),
                    ),
                ],
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        if(onTap != null){
            return PlatformTapWidget(
                onTap: onTap,
                child: _listTitleWidget(),
            );
        }else{
            return _listTitleWidget();
        }
    }
}