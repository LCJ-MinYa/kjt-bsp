import 'package:flutter/material.dart';
import 'package:kjt_bsp/screen/order/allOrderScreen.dart';
import 'package:kjt_bsp/styles/uiSize.dart';

class OrderScreen extends StatefulWidget {
    @override
    _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with AutomaticKeepAliveClientMixin{
    @override
    bool get wantKeepAlive => true;
    
    /* 顶部tabbar */
    Widget _orderTabbarWidget(){
        return AppBar(
            //第一种自定义高度，PreferredSize会让tabbar位于appbar底部
            bottom: PreferredSize(
                child: TabBar(
                    tabs: <Widget>[
                        Tab(text: '全部订单'),
                        Tab(text: '历史订单'),
                        Tab(text: '待支付订单')
                    ],
                    labelColor: Theme.of(context).primaryColor,
                    labelStyle: TextStyle(
                        fontSize: UISize.appBarFontSize(),
                        fontWeight: FontWeight.bold
                    ),
                    unselectedLabelColor: Theme.of(context).primaryColorLight,
                    unselectedLabelStyle: TextStyle(
                        fontSize: UISize.appBarFontSize(),
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                ), preferredSize: Size(0, 0),
            ),
            //第二种放在安全区内，SafeArea会让tabbar居中appbar
            // flexibleSpace: SafeArea(
            //     child: TabBar(
            //         tabs: <Widget>[
            //             Tab(text: '全部订单'),
            //             Tab(text: '历史订单'),
            //             Tab(text: '待支付订单')
            //         ],
            //         labelColor: Theme.of(context).primaryColor,
            //         labelStyle: TextStyle(
            //             fontSize: UISize.size(32)
            //         ),
            //         unselectedLabelColor: Theme.of(context).primaryColorLight,
            //         unselectedLabelStyle: TextStyle(
            //             fontSize: UISize.size(32)
            //         ),
            //         indicatorSize: TabBarIndicatorSize.label,
            //     ),
            // ),
        );
    }

    @override
    Widget build(BuildContext context) {
        super.build(context);
        UISize.init(context);

        return DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: _orderTabbarWidget(),
                body: TabBarView(
                    children: <Widget>[
                        AllOrderScreen(),
                        AllOrderScreen(),
                        AllOrderScreen(),
                    ],
                ),
            ),
        );
    }
}