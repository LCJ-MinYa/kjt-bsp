import 'package:flutter/material.dart';
import 'package:kjt_bsp/widget/button/navigatorRightButtonWidget.dart';
import 'package:kjt_bsp/widget/text/appBarTextWidget.dart';

class AddProductScreen extends StatefulWidget {
    @override
    _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: AppBarTextWidget(title: '添加商品'),
                actions: <Widget>[
                    NavigatorRightButtonWidget(
                        text: '确认',
                        onTap: (){},
                    )
                ],
            ),
            body: Container(
                
            ),
        );
    }
}