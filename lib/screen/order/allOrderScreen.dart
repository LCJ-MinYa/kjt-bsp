import 'package:flutter/material.dart';
import 'package:kjt_bsp/config/appConfig.dart';
import 'package:kjt_bsp/styles/uiSize.dart';

class AllOrderScreen extends StatefulWidget {
    @override
    _AllOrderScreenState createState() => _AllOrderScreenState();
}

class _AllOrderScreenState extends State<AllOrderScreen> with AutomaticKeepAliveClientMixin{
    @override
    bool get wantKeepAlive => true;
    
    final List _allOrderList = [{
        'orderNo': 201907071110000,
        'status': 0,
        'productList': [{
            'productName': '澳大利亚CRO椰子洗护 宝宝椰子洗发沐浴二合一500ml/瓶(白色)',
            'price': 80.00,
            'nums': 1,
            'productId': 'CEPUSHA10180092'
        },{
            'productName': '澳大利亚CRO椰子洗护 宝宝椰子洗发沐浴二合一500ml/瓶(白色)',
            'price': 80.00,
            'nums': 1,
            'productId': 'CEPUSHA10180092'
        }],
    }];

    /* 订单号 */
    Widget _orderNoWidget(index){
        return Row(
            children: <Widget>[
                Image.asset(
                    AppConfig.orderImgUrl + 'orderNo.png',
                    width: UISize.width(32),
                    height: UISize.width(32),
                ),
                Padding(
                    padding: EdgeInsets.only(left: UISize.width(16)),
                    child: Text(
                        '订单号: ${_allOrderList[index]['orderNo']}',
                        style: TextStyle(
                            fontSize: UISize.size(24),
                            color: Color(0xff333333),
                        ),
                    ),
                ),
            ],
        );
    }

    /* 订单商品列表 */
    Widget _orderProductListWidget(index){
        Widget _productContent;
        List<Widget> _proudctListWidget = [];
        for(var item in _allOrderList[index]['productList']){
            _proudctListWidget.add(
                Padding(
                    padding: EdgeInsets.only(top: UISize.height(24)),
                    child: Row(
                        children: <Widget>[
                            Expanded(
                                child: Text(
                                    item['productName'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: UISize.size(28),
                                        color: Color(0xff333333)
                                    ),
                                ), 
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: UISize.width(35)),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                        Text(
                                            '￥${item['price']}',
                                            style: TextStyle(
                                                fontSize: UISize.size(28),
                                                color: Color(0xff333333)
                                            )
                                        ),
                                        Text(
                                            'x${item['nums']}',
                                            style: TextStyle(
                                                fontSize: UISize.size(28),
                                                color: Color(0xff666666)
                                            )
                                        )
                                    ],
                                ),
                            ),
                        ],
                    )
                )
            );
        }
        _productContent = Column(
            children: _proudctListWidget,
        );
        return _productContent;
    }

    /* 订单列表item */
    Widget _orderItemWidget(index){
        return Container(
            padding: EdgeInsets.only(
                left: UISize.width(24),
                right: UISize.width(24),
                top: UISize.height(32),
                bottom: UISize.height(32)
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Column(
                children: <Widget>[
                    _orderNoWidget(index),
                    _orderProductListWidget(index),
                ],
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        super.build(context);
        UISize.init(context);

        return ListView.builder(
            padding: EdgeInsets.all(UISize.width(32)),
            itemCount: _allOrderList.length,
            itemBuilder: (context, index){
                return _orderItemWidget(index);
            },
        );
    }
}