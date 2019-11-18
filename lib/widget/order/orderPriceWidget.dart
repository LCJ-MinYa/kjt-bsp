import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';

/* 订单价格 */
class OrderPriceWidget extends StatelessWidget {
    final Map orderMessage;

    OrderPriceWidget({
        this.orderMessage
    });

    @override
    Widget build(BuildContext context) {
        int orderNums = 0;
        double orderPrice = 0;
        for(var item in orderMessage['productList']){
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
}