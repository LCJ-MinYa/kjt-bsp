import 'package:flutter/material.dart';
import 'package:kjt_bsp/config/appConfig.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/button/smallDealButtonWidget.dart';
import 'package:kjt_bsp/widget/tap/platformTapWidget.dart';

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
            'price': 160.00,
            'nums': 2,
            'productId': 'CEPUSHA10180092'
        }],
    },{
        'orderNo': 201907071110000,
        'status': 1,
        'productList': [{
            'productName': '澳大利亚CRO椰子洗护 宝宝椰子洗发沐浴二合一500ml/瓶(白色)',
            'price': 80.00,
            'nums': 1,
            'productId': 'CEPUSHA10180092'
        }],
    },{
        'orderNo': 201907071110000,
        'status': 2,
        'productList': [{
            'productName': '澳大利亚CRO椰子洗护 宝宝椰子洗发沐浴二合一500ml/瓶(白色)',
            'price': 400.00,
            'nums': 5,
            'productId': 'CEPUSHA10180092'
        },{
            'productName': '澳大利亚CRO椰子洗护 宝宝椰子洗发沐浴二合一500ml/瓶(白色)',
            'price': 160.00,
            'nums': 2,
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Row(
                                children: <Widget>[
                                    Expanded(
                                        child: Text(
                                            item['productName'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: UISize.size(28),
                                                color: Color(0xff333333),
                                                height: UISize.height(2.5)
                                            ),
                                        ), 
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: UISize.width(35)),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                                Text(
                                                    '￥${item['price'].toStringAsFixed(2)}',
                                                    style: TextStyle(
                                                        fontSize: UISize.size(28),
                                                        color: Color(0xff333333),
                                                        height: UISize.height(2.5)
                                                    )
                                                ),
                                                Text(
                                                    'x${item['nums']}',
                                                    style: TextStyle(
                                                        fontSize: UISize.size(28),
                                                        height: UISize.height(2.5),
                                                        color: Color(0xff666666)
                                                    )
                                                )
                                            ],
                                        ),
                                    ),
                                ],
                            ),
                            SizedBox(height: UISize.height(12)),
                            Text(
                                '商品ID: ${item['productId']}',
                                style: TextStyle(
                                    fontSize: UISize.size(24),
                                    color: Color(0xff666666)
                                )
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

    /* 订单价格 */
    Widget _orderPriceWidget(index){
        int orderNums = 0;
        double orderPrice = 0;
        for(var item in _allOrderList[index]['productList']){
            orderNums += item['nums']; 
            orderPrice += item['price'];
        }
        return Container(
            padding: EdgeInsets.only(top: UISize.height(32)),
            alignment: Alignment.centerRight,
            child: Text.rich(
                TextSpan(
                    children: [
                        TextSpan(
                            text: '共$orderNums件商品合计:',
                            style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: UISize.size(28)
                            )
                        ),
                        TextSpan(
                            text: '￥${orderPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: UISize.size(28),
                                fontWeight: FontWeight.bold
                            )
                        )
                    ]
                )
            ),
        );
    }

    /* 作废修改支付订单占位widget */
    Widget _dealOrderPlaceholderWidget(index){
        return Offstage(
            offstage: _allOrderList[index]['status'] != 0,
            child: Container(width: double.infinity, height: UISize.width(60),),
        );
    }

    /* 作废修改支付订单 */
    Widget _dealOrderWidget(index){
        if(_allOrderList[index]['status'] == 0){
            return Positioned(
                bottom: UISize.height(32),
                right: UISize.width(24), 
                child:  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                        SmallDealButtonWidget(
                            text: '作废',
                            borderColor: Color(0xffb3b3b3),
                            textColor: Color(0xffb3b3b3),
                            onTap: (){print(123);},
                        ),
                        SmallDealButtonWidget(
                            onTap: (){},
                            text: '修改',
                        ),
                        SmallDealButtonWidget(
                            onTap: (){},
                            text: '支付',
                            bgColor: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                        ),
                    ],
                ),
            );
        }else{
            return Container(width: 0, height: 0);
        }
    }

    /* 订单列表item */
    Widget _orderItemWidget(index){
        String imgUrl = AppConfig.orderImgUrl;
        switch(_allOrderList[index]['status']){
            case 0:
                imgUrl += 'pay.png';
                break;
            case 1:
                imgUrl += 'paid.png';
                break;
            case 2:
                imgUrl += 'invalid.png';
                break;
        }
        return Padding(
            padding: EdgeInsets.only(top: UISize.width(index == 0 ? 0 : 32)),
            child: Stack(
                children: <Widget>[
                    PlatformTapWidget(
                        onTap: (){},
                        child: Container(
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
                                    _orderPriceWidget(index),
                                    _dealOrderPlaceholderWidget(index),
                                ],
                            ),
                        ),
                    ),
                    _dealOrderWidget(index),
                    Positioned(
                        top: UISize.width(-5),
                        right: UISize.width(24),
                        child: Image.asset(
                            imgUrl,
                            width: UISize.width(80),
                            height: UISize.width(80),
                        ),
                    ),
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