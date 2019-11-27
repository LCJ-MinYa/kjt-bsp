import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/cell/containerCellWidget.dart';
import 'package:kjt_bsp/widget/cell/nameCellWidget.dart';
import 'package:kjt_bsp/widget/cell/textFieldCellWidget.dart';
import 'package:kjt_bsp/widget/cell/titleWithNameCellWidget.dart';
import 'package:kjt_bsp/widget/tap/platformTapWidget.dart';
import 'package:kjt_bsp/widget/text/appBarTextWidget.dart';

class OrderEntryScreen extends StatefulWidget {
    @override
    _OrderEntryScreenState createState() => _OrderEntryScreenState();
}

class _OrderEntryScreenState extends State<OrderEntryScreen> {
    /* 添加商品按钮 */
    Widget _addProductActionWidget(){
        return PlatformTapWidget(
            onTap: (){},
            child: ContainerCellWidget(
                child: Row(
                    children: <Widget>[
                        Icon(
                            Icons.add_circle_outline,
                            size: UISize.size(40),
                        ),
                        SizedBox(width: UISize.width(32)),
                        Text(
                            '添加商品',
                            style: TextStyle(
                                fontSize: UISize.size(30)
                            ),
                        ),
                    ],
                ),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: AppBarTextWidget(title: '订单录入'),
                actions: <Widget>[
                    PlatformTapWidget(
                        onTap: (){
                            
                        },
                        child: Text(
                            '提交',
                            style: TextStyle(
                                fontSize: UISize.size(30)
                            ),
                        ),
                    )
                ],
            ),
            body: ListView(
                padding: EdgeInsets.only(bottom: UISize.width(96)),
                children: <Widget>[
                    TitleWithNameCellWidget(title: '代购信息'),
                    TextFieldCellWidget(
                        title: '姓名',
                        hintText: '请填写代购人姓名',
                    ),
                    TextFieldCellWidget(
                        title: '手机号码',
                        hintText: '请填写代购人手机号码',
                    ),
                    NameCellWidget(
                        title: '证件类型',
                        value: '请选择',
                        onTap: (){},
                    ),
                    TextFieldCellWidget(
                        title: '证件号码',
                        hintText: '请填写代购人身份证号码',
                    ),
                    TitleWithNameCellWidget(title: '订单信息'),
                    _addProductActionWidget(),
                    TitleWithNameCellWidget(title: '订单配送信息'),
                    TextFieldCellWidget(
                        title: '姓名',
                        hintText: '请填写收货人姓名',
                    ),
                    TextFieldCellWidget(
                        title: '电话号码',
                        hintText: '请填写收货人手机号',
                    ),
                    NameCellWidget(
                        title: '所在地区',
                        value: '请选择',
                        onTap: (){},
                    ),
                    TextFieldCellWidget(
                        title: '详细地址',
                        hintText: '街道、楼牌号等',
                    ),
                    TitleWithNameCellWidget(title: '下单用户实名认证信息'),
                    TextFieldCellWidget(
                        title: '姓名',
                        hintText: '请填写真实姓名',
                    ),
                    TextFieldCellWidget(
                        title: '身份证号',
                        hintText: '下单用户身份证号码',
                    ),
                    TextFieldCellWidget(
                        title: '手机号码',
                        hintText: '请填写下单用户手机号码',
                    ),
                    TextFieldCellWidget(
                        title: '邮箱',
                        hintText: '请填写下单用户常用邮箱',
                    ),
                ],
            ),
        );
    }
}