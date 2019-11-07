import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';

class AllOrderScreen extends StatefulWidget {
    @override
    _AllOrderScreenState createState() => _AllOrderScreenState();
}

class _AllOrderScreenState extends State<AllOrderScreen> with AutomaticKeepAliveClientMixin{
    @override
    bool get wantKeepAlive => true;
    
    final List _allOrderList = [
        'all order',
        'all order',
        'all order',
        'all order',
        'all order',
        'all order',
        'all order',
        'all order',
        'all order',
        'all order',
        'all order',
        'all order',
        'all order',
        'all order',
        'all order',
        'all order',
    ];

    @override
    Widget build(BuildContext context) {
        super.build(context);
        UISize.init(context);

        return ListView.builder(
            itemCount: _allOrderList.length,
            itemBuilder: (context, index){
                return Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(_allOrderList[index] + index.toString()),
                );
            },
        );
    }
}