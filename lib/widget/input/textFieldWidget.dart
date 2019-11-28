import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/tap/platformTapWidget.dart';

/*
 * 通用输入框组件
 */
class TextFieldWidget extends StatefulWidget {
    final String hintText;                  //提示文本
    final bool isPwd;                       //是否密码 => 默认不是
    final bool isShowPwd;                   //显示密码明文 => 默认不显示明文
    final int maxLength;                    //最长输入字符 => 默认20
    final TextInputType keyboardType;       //键盘类型 => 默认text
    final Function onChanged;               //输入改变事件
    final double rightIconMargin;           //右侧icon距离右边距离 => 默认15dp
    final double fontSize;                  //字体大小 => 默认15dp

    TextFieldWidget({
        Key key,
        @required this.hintText,
        this.isPwd = false,
        this.isShowPwd = false,
        this.maxLength = 20,
        this.keyboardType = TextInputType.text,
        this.onChanged,
        this.rightIconMargin = 30,
        this.fontSize = 30
    }) : super(key: key);

    @override
    _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
    bool _isPwd;
    bool _isShowPwd;

    @override
    void initState() {
        super.initState();
        _isPwd = widget.isPwd;
        _isShowPwd = widget.isShowPwd;
    }

    @override
    Widget build(BuildContext context) {
        UISize.init(context);

        return Expanded(
            child: Row(
                children: <Widget>[
                    Expanded(
                        child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            alignment: Alignment.centerLeft,
                            child: TextField(
                                maxLength: widget.maxLength,
                                decoration: InputDecoration(
                                    hintText: widget.hintText,
                                    hintStyle: TextStyle(
                                        color: Color(0xffb3b3b3),
                                        fontSize: UISize.size(widget.fontSize)
                                    ),
                                    border: InputBorder.none,
                                    counterText: '',
                                    contentPadding: EdgeInsets.zero
                                ),
                                style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: UISize.size(widget.fontSize)
                                ),
                                cursorColor: Color(0xff333333),
                                obscureText: _isPwd,
                                keyboardType: widget.keyboardType,
                                onChanged: widget.onChanged,
                            ),
                        ),
                    ),
                    widget.isPwd ? Container(
                        width: UISize.width(40),
                        height: double.infinity,
                        margin: EdgeInsets.only(right: UISize.width(widget.rightIconMargin)),
                        child: PlatformTapWidget(
                            onTap: _toggleShowPwd,
                            child: Icon(
                                _isShowPwd ? Icons.visibility_off : Icons.visibility,
                                size: UISize.size(36),
                                color: Color(0xffb3b3b3),
                            ),
                        ),
                    ) : Container(width: 0, height: 0),
                ],
            )
        );
    }

    _toggleShowPwd(){
        setState(() {
            _isShowPwd = !_isShowPwd;
            _isPwd = !_isPwd;
        });
    }
}