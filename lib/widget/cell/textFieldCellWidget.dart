import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/cell/containerCellWidget.dart';
import 'package:kjt_bsp/widget/input/textFieldWidget.dart';
import 'package:kjt_bsp/widget/tap/platformTapWidget.dart';

class TextFieldCellWidget extends StatelessWidget {
    final Function onTap;           //是否能点击，点击事件
    final String title;             //标题
    final Color bgColor;            //背景颜色 =>默认白色
    final bool showArrow;           //是否显示右侧箭头 =>默认不显示(当有箭头时，不允许输入，只能通过点击cell赋值给textfield))
    final double height;            //自定义高度 => 默认48dp
    final double borderRadius;      //是否有圆角 => 默认无圆角
    final bool showBottomBorder;    //是否显示底部边框 => 默认显示

    /* textField传递字段 */
    final String hintText;                  //提示文本
    final bool isPwd;                       //是否密码 => 默认不是
    final bool isShowPwd;                   //显示密码明文 => 默认不显示明文
    final int maxLength;                    //最长输入字符 => 默认20
    final TextInputType keyboardType;       //键盘类型 => 默认text
    final Function onChanged;               //输入改变事件

    TextFieldCellWidget({
        this.onTap,
        @required this.title,
        this.bgColor = Colors.white,
        this.showArrow = false,
        this.height = 96,
        this.borderRadius = 0,
        this.showBottomBorder = true,

        @required this.hintText,
        this.isPwd = false,
        this.isShowPwd = false,
        this.maxLength = 20,
        this.keyboardType = TextInputType.text,
        this.onChanged
    });

    Widget _textFieldCellWidget(){
        return ContainerCellWidget(
            height: height,
            bgColor: bgColor,
            borderRadius: borderRadius,
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
                        Container(
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
                        ),
                        TextFieldWidget(
                            hintText: hintText,
                            maxLength: maxLength,
                            keyboardType: keyboardType,
                            isPwd: isPwd,
                            isShowPwd: isShowPwd,
                            onChanged: onChanged,
                        )
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
                child: _textFieldCellWidget(),
            );
        }else{
            return _textFieldCellWidget();
        }
    }
}