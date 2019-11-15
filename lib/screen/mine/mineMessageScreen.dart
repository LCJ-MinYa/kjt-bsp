import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/text/appBarTextWidget.dart';
import '../../widget/cell/nameCellWidget.dart';

class MineMessageScreen extends StatefulWidget {
    @override
    _MineMessageScreenState createState() => _MineMessageScreenState();
}

class _MineMessageScreenState extends State<MineMessageScreen> {
    Widget _titleWithNameWidget(name){
        return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: UISize.width(32)),
            width: double.infinity,
            height: UISize.height(96),
            child: Text(
                name,
                style: TextStyle(
                    fontSize: UISize.size(26),
                    color: Color(0xff333333)
                ),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: AppBarTextWidget(title: '我的信息'),
            ),
            body: ListView(
                children: <Widget>[
                    _titleWithNameWidget('基本信息'),
                    NameCellWidget(
                        title: '姓名',
                        value: '路飞',
                    ),
                    NameCellWidget(
                        title: '电话',
                        value: '181****6852',
                    ),
                    NameCellWidget(
                        title: '证件类型',
                        value: '身份证',
                    ),
                    NameCellWidget(
                        title: '证件号码',
                        value: '510902****2222',
                    ),
                    _titleWithNameWidget('公司信息'),
                    NameCellWidget(
                        title: '转运公司',
                        value: '驿友',
                    ),
                ],
            )
        );
    }
}