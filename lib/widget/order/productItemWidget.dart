import 'package:flutter/material.dart';
import 'package:kjt_bsp/config/imgConfig.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/button/smallDealButtonWidget.dart';

class ProductItemWidget extends StatelessWidget {
    final Map productItemData;
    final int index;
    final Function onTap;

    ProductItemWidget({
        @required this.productItemData,
        this.index,
        this.onTap,
    });

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: EdgeInsets.only(top: UISize.width(index == 0 ? 0 : 12)), 
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(UISize.width(32)),
                color: Colors.white,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Image.asset(
                            ImgConfig.orderProduct,
                            width: UISize.width(40),
                            height: UISize.width(40),
                            fit: BoxFit.cover,
                        ),
                        SizedBox(width: UISize.width(32)),
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                    Text(
                                        productItemData['productName'],
                                        style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: UISize.size(30)
                                        ),
                                    ),
                                    SizedBox(height: UISize.width(16)),
                                    Row(
                                        children: <Widget>[
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: UISize.width(8),
                                                    right: UISize.width(8),
                                                    top: UISize.width(4),
                                                    bottom: UISize.width(4)
                                                ),
                                                color: Color(0xffe0e4e6),
                                                child: Text(
                                                    '品牌:${productItemData['brand']}',
                                                    style: TextStyle(
                                                        color: Color(0xff666666),
                                                        fontSize: UISize.size(24)
                                                    ),
                                                ),
                                            ),
                                            SizedBox(width: UISize.width(8)),
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: UISize.width(8),
                                                    right: UISize.width(8),
                                                    top: UISize.width(4),
                                                    bottom: UISize.width(4)
                                                ),
                                                color: Color(0xffe0e4e6),
                                                child: Text(
                                                    '型号:${productItemData['type']}',
                                                    style: TextStyle(
                                                        color: Color(0xff666666),
                                                        fontSize: UISize.size(24)
                                                    ),
                                                ),
                                            ),
                                        ],
                                    ),
                                    SizedBox(height: UISize.width(16)),
                                    Text(
                                        '商品ID:${productItemData['productId']}',
                                        style: TextStyle(
                                            color: Color(0xff666666),
                                            fontSize: UISize.size(26)
                                        ),
                                    ),
                                    SizedBox(height: UISize.width(24)),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                            SmallDealButtonWidget(
                                                text: '添加',
                                                bgColor: Theme.of(context).primaryColor,
                                                textColor: Colors.white,
                                                onTap: onTap,
                                            )
                                        ],
                                    ),
                                ],
                            ),
                        )
                    ],
                ),
            )
        );
    }
}