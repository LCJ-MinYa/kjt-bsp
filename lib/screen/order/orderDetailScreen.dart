import 'package:flutter/material.dart';
import 'package:kjt_bsp/widget/text/appBarTextWidget.dart';

class OrderDetailScreen extends StatefulWidget {
    final Map arguments;

    OrderDetailScreen({Key key, this.arguments}) : super(key: key);

    @override
    _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
    @override
    void initState() {
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: AppBarTextWidget(title: '订单信息'),
            ),
        );
    }
}