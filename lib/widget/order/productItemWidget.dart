import 'package:flutter/material.dart';
import 'package:kjt_bsp/config/imgConfig.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/button/smallDealButtonWidget.dart';
import 'package:kjt_bsp/widget/tap/platformTapWidget.dart';

class ProductItemWidget extends StatelessWidget {
    final Map productItemData;
    final int index;
    final Function onTap;
    final Function reduceNum;
    final Function addNum;

    ProductItemWidget({
        @required this.productItemData,
        this.index,
        this.onTap,
        this.reduceNum,
        this.addNum
    });

    /* 属性容器 */
    Widget _propertyContainerWidget(text){
        return Container(
            padding: EdgeInsets.only(
                left: UISize.width(8),
                right: UISize.width(8),
                top: UISize.width(4),
                bottom: UISize.width(4)
            ),
            color: Color(0xffe0e4e6),
            child: Text(
                text,
                style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: UISize.size(24)
                ),
            ),
        );
    }

    /* 加减操作容器 */
    Widget _dealProductContainerWidget(child){
        return Container(
            width: UISize.width(48),
            height: UISize.width(48),
            alignment: Alignment.center,
            child: child,
        );
    }

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
                                    Offstage(
                                        offstage: index == null,
                                        child: Row(
                                            children: <Widget>[
                                                _propertyContainerWidget('品牌:${productItemData['brand']}'),
                                                SizedBox(width: UISize.width(8)),
                                                _propertyContainerWidget('型号:${productItemData['type']}'),
                                            ],
                                        ),
                                    ),
                                    Offstage(
                                        offstage: index == null,
                                        child: SizedBox(height: UISize.width(16)),
                                    ),
                                    Text(
                                        '商品ID:${productItemData['productId']}',
                                        style: TextStyle(
                                            color: Color(0xff666666),
                                            fontSize: UISize.size(26)
                                        ),
                                    ),
                                    SizedBox(height: UISize.width(24)),
                                    index != null ? Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                            SmallDealButtonWidget(
                                                text: '添加',
                                                bgColor: Theme.of(context).primaryColor,
                                                textColor: Colors.white,
                                                onTap: onTap,
                                            )
                                        ],
                                    ) : Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                            _dealProductContainerWidget(
                                                PlatformTapWidget(
                                                    onTap: reduceNum,
                                                    child: Icon(Icons.remove_circle_outline),
                                                )
                                            ),
                                            _dealProductContainerWidget(
                                                Text(productItemData['num'].toString())
                                            ),
                                            _dealProductContainerWidget(
                                                PlatformTapWidget(
                                                    onTap: addNum,
                                                    child: Icon(Icons.add_circle),
                                                )
                                            ),
                                        ]
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