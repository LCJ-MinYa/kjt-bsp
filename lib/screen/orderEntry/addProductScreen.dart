import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/button/navigatorRightButtonWidget.dart';
import 'package:kjt_bsp/widget/cell/containerCellWidget.dart';
import 'package:kjt_bsp/widget/input/textFieldWidget.dart';
import 'package:kjt_bsp/widget/text/appBarTextWidget.dart';

class AddProductScreen extends StatefulWidget {
    @override
    _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
    /* 搜索框 */
    Widget _searchWidget(){
        return ContainerCellWidget(
            child: Padding(
                padding: EdgeInsets.only(
                    right: UISize.width(32),
                    top: UISize.height(20),
                    bottom: UISize.height(20)
                ),
                child: Container( 
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: UISize.width(1),
                            color: Color(0xffE0E4E6)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(UISize.width(4)))
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            Container(
                                width: UISize.width(56),
                                height: double.infinity,
                                padding: EdgeInsets.all(UISize.width(16)),
                                child: Icon(
                                    Icons.search,
                                    size: UISize.size(30),
                                    color: Color(0xff333333),
                                ),
                            ),
                            TextFieldWidget(
                                hintText: '搜索商品名称',
                                fontSize: 24,
                            )
                        ],
                    ),
                ),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                elevation: 0.0,
                title: AppBarTextWidget(title: '添加商品'),
                actions: <Widget>[
                    NavigatorRightButtonWidget(
                        text: '确认',
                        onTap: (){},
                    )
                ],
            ),
            body: Column(
                children: <Widget>[
                    _searchWidget(),
                ],
            ),
        );
    }
}