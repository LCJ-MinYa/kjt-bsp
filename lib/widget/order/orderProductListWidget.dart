import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';

/* 订单商品列表 */
class OrderProductListWidget extends StatelessWidget {
    final Map orderMessage;

    OrderProductListWidget({
        this.orderMessage
    });

    @override
    Widget build(BuildContext context) {
        Widget _productContent;
        List<Widget> _proudctListWidget = [];
        for(var item in orderMessage['productList']){
            _proudctListWidget.add(
                Padding(
                    padding: EdgeInsets.only(top: UISize.height(24)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
}