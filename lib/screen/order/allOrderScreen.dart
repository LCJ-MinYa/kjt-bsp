import 'package:flutter/material.dart';
import 'package:kjt_bsp/config/imgConfig.dart';
import 'package:kjt_bsp/controller/order.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/button/smallDealButtonWidget.dart';
import 'package:kjt_bsp/widget/list/refreshScreen.dart';
import 'package:kjt_bsp/widget/order/orderPriceWidget.dart';
import 'package:kjt_bsp/widget/order/orderProductListWidget.dart';
import 'package:kjt_bsp/widget/popup/alertDialog.dart';
import 'package:kjt_bsp/widget/popup/selectPayment.dart';
import 'package:kjt_bsp/widget/tap/platformTapWidget.dart';

class AllOrderScreen extends StatefulWidget {
    final int status;

    AllOrderScreen({
        Key key, 
        this.status
    }) : super(key: key);


    @override
    _AllOrderScreenState createState() => _AllOrderScreenState();
}

class _AllOrderScreenState extends State<AllOrderScreen> with AutomaticKeepAliveClientMixin{
    @override
    bool get wantKeepAlive => true;

    /* 订单号 */
    Widget _orderNoWidget(item, index){
        return Row(
            children: <Widget>[
                Image.asset(
                    ImgConfig.orderNo,
                    width: UISize.width(32),
                    height: UISize.width(32),
                ),
                Padding(
                    padding: EdgeInsets.only(left: UISize.width(16)),
                    child: Text(
                        '订单号: ${item['orderNo']}',
                        style: TextStyle(
                            fontSize: UISize.size(24),
                            color: Color(0xff333333),
                        ),
                    ),
                ),
            ],
        );
    }

    /* 作废修改支付订单占位widget */
    Widget _dealOrderPlaceholderWidget(item, index){
        return Offstage(
            offstage: item['status'] != 0,
            child: Container(width: double.infinity, height: UISize.width(60),),
        );
    }

    /* 作废修改支付订单 */
    Widget _dealOrderWidget(item, index){
        if(item['status'] == 0){
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
                            onTap: (){
                                showAlertDialog(context, '订单作废', '确认作废此订单？', (){});
                            },
                        ),
                        SmallDealButtonWidget(
                            onTap: (){},
                            text: '修改',
                        ),
                        SmallDealButtonWidget(
                            onTap: (){
                                showSelectPayment(context);
                            },
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
    Widget _orderItemWidget(item, index){
        String imgUrl;
        switch(item['status']){
            case 0:
                imgUrl = ImgConfig.orderPay;
                break;
            case 1:
                imgUrl = ImgConfig.orderPaid;
                break;
            case 2:
                imgUrl = ImgConfig.orderInvalid;
                break;
        }
        return Padding(
            padding: EdgeInsets.only(top: UISize.width(index == 0 ? 0 : 32)),
            child: Stack(
                children: <Widget>[
                    PlatformTapWidget(
                        onTap: (){
                            _goOrderDetailScreen(item['orderNo']);
                        },
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
                                    _orderNoWidget(item, index),
                                    OrderProductListWidget(orderMessage: item),
                                    OrderPriceWidget(orderMessage: item),
                                    _dealOrderPlaceholderWidget(item, index),
                                ],
                            ),
                        ),
                    ),
                    _dealOrderWidget(item, index),
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

        return RefreshList(
            child: _orderItemWidget,
            onRefresh: getOrderList,
            onLoad: getOrderList,
        );
    }

    _goOrderDetailScreen(orderNo){
        Navigator.pushNamed(
            context,
            '/orderDetail',
            arguments: {
                'orderNo': orderNo
            }
        );
    }
}