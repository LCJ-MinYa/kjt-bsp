import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';

class OrderScreen extends StatefulWidget {
    @override
    _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with AutomaticKeepAliveClientMixin{
    @override
    bool get wantKeepAlive => true;
    
    @override
    Widget build(BuildContext context) {
        super.build(context);
        UISize.init(context);

        return DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                    bottom: PreferredSize(
                        child: TabBar(
                            tabs: <Widget>[
                                Tab(text: '全部订单'),
                                Tab(text: '历史订单'),
                                Tab(text: '待支付订单')
                            ],
                            labelColor: Theme.of(context).primaryColor,
                            labelStyle: TextStyle(
                                fontSize: UISize.size(32)
                            ),
                            unselectedLabelColor: Theme.of(context).primaryColorLight,
                            unselectedLabelStyle: TextStyle(
                                fontSize: UISize.size(28)
                            ),
                            indicatorSize: TabBarIndicatorSize.label,
                        ), preferredSize: Size(0, 0),
                    ),
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
                    //             fontSize: UISize.size(28)
                    //         ),
                    //         indicatorSize: TabBarIndicatorSize.label,
                    //     ),
                    // ),
                ),
                body: TabBarView(
                    children: <Widget>[
                        ListView(
                            children: <Widget>[
                                Text('第一个页面'),
                            ],
                        ),
                        ListView(
                            children: <Widget>[
                                Text('第二个页面'),
                            ],
                        ),
                        ListView(
                            children: <Widget>[
                                Text('第三个页面'),
                            ],
                        ),
                    ],
                ),
            ),
        );
    }
}