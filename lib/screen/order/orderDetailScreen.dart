import 'package:flutter/material.dart';
import 'package:kjt_bsp/common/httpRequest.dart';
import 'package:kjt_bsp/config/apiConfig.dart';
import 'package:kjt_bsp/config/imgConfig.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/button/smallDealButtonWidget.dart';
import 'package:kjt_bsp/widget/order/orderPriceWidget.dart';
import 'package:kjt_bsp/widget/order/orderProductListWidget.dart';
import 'package:kjt_bsp/widget/popup/alertDialog.dart';
import 'package:kjt_bsp/widget/popup/selectPayment.dart';
import 'package:kjt_bsp/widget/text/appBarTextWidget.dart';

class OrderDetailScreen extends StatefulWidget {
    final Map arguments;

    OrderDetailScreen({Key key, this.arguments}) : super(key: key);

    @override
    _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
    @override
    void initState() {
        super.initState();
        HttpRequest.post(ApiConfig.orderList, {
            'pageIndex': 1
        });
    }

    final Map _orderDetailMap = {
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
    };

    /* 作废修改支付订单 */
    Widget _dealOrderWidget(){
        return Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.only(right: UISize.width(32)),
                width: double.infinity,
                height: UISize.width(100),
                color: Color(0xfffafafa),
                child: Row(
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
            ),
        );
    }

    /* 订单信息容器padding封装 */
    Widget _orderMessageWithPaddingWidget(widget){
        return Padding(
            padding: EdgeInsets.only(top: UISize.width(12)),
            child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.all(UISize.width(32)),
                child: widget,
            ),
        );
    }

    /* 订单信息title封装 */
    Widget _orderMessageWithTitleWidget(iconName, title){
        return Padding(
            padding: EdgeInsets.only(bottom: UISize.width(24)),
            child: Row(
                children: <Widget>[
                    Icon(
                        iconName,
                        size: UISize.width(32),
                        color: Color(0xff333333),
                    ),
                    SizedBox(width: UISize.width(16)),
                    Text(
                        title,
                        style: TextStyle(
                            fontSize: UISize.size(30),
                            fontWeight: FontWeight.bold,
                            color: Color(0xff333333),
                        ),
                    )
                ],
            ),
        ); 
    }

    /* 订单信息cell封装 */
    Widget _orderMessageWithCellWidget(title, value){
        final TextStyle _textStyle = TextStyle(
            fontSize: UISize.size(28),
            height: 1.5,
            color: Color(0xff333333)
        );

        return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Container(
                    width: UISize.width(120),
                    child: Text(
                        title,
                        style: _textStyle,
                    ),
                ),
                SizedBox(width: UISize.width(66)),
                Expanded(
                    child: Text(
                        value,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: _textStyle,
                    ),
                )
            ],
        );
    }

    /* 代购信息 */
    Widget _bspMessageWidget(){
        return Column(
            children: <Widget>[
                _orderMessageWithTitleWidget(Icons.airplanemode_active, '代购信息'),
                Stack(
                    children: <Widget>[
                        Column(
                            children: <Widget>[
                                _orderMessageWithCellWidget('姓名', '路飞'),
                                _orderMessageWithCellWidget('手机号码', '18188886666'),
                                _orderMessageWithCellWidget('证件类型', '身份证'),
                                _orderMessageWithCellWidget('证件号码', '510905199910102222'),
                            ],
                        ),
                        Positioned(
                            right: 0,
                            top: 0,
                            child: Image.asset(
                                ImgConfig.orderPay,
                                width: UISize.width(120),
                                height: UISize.width(120),
                                fit: BoxFit.contain,
                            ),
                        )
                    ],
                )
            ],
        );
    }

    /* 商品信息 */
    Widget _productMessageWidget(){
        return Column(
            children: <Widget>[
                _orderMessageWithTitleWidget(Icons.shopping_basket, '商品信息'),
                OrderProductListWidget(orderMessage: _orderDetailMap),
                OrderPriceWidget(orderMessage: _orderDetailMap),
            ],
        );
    }

    /* 订单配送信息 */
    Widget _distributionMessageWidget(){
        return Column(
            children: <Widget>[
                _orderMessageWithTitleWidget(Icons.local_shipping, '订单配送信息'),
                _orderMessageWithCellWidget('姓名', '路飞'),
                _orderMessageWithCellWidget('手机号码', '18188886666'),
                _orderMessageWithCellWidget('所在地区', '四川省成都市武侯区'),
                _orderMessageWithCellWidget('详细地址', '天府五街200号 菁蓉国际广场 2A9楼1001室'),
            ],
        );
    }

    /* 下单用户实名认证信息 */
    Widget _realNameMessageWidget(){
        return Column(
            children: <Widget>[
                _orderMessageWithTitleWidget(Icons.recent_actors, '下单用户实名认证信息'),
                _orderMessageWithCellWidget('姓名', '路飞'),
                _orderMessageWithCellWidget('身份证号', '510905199910102222'),
                _orderMessageWithCellWidget('手机号码', '18188886666'),
                _orderMessageWithCellWidget('邮箱', 'lufei@qq.com'),
            ],
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Color(0xfffafafa),
            appBar: AppBar(
                title: AppBarTextWidget(title: '订单信息'),
            ),
            body: SafeArea(
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color(0xfff5f5f5),
                    child: Stack(
                        children: <Widget>[
                            ListView(
                                padding: EdgeInsets.only(bottom: UISize.width(100)),
                                children: <Widget>[
                                    _orderMessageWithPaddingWidget(_bspMessageWidget()),
                                    _orderMessageWithPaddingWidget(_productMessageWidget()),
                                    _orderMessageWithPaddingWidget(_distributionMessageWidget()),
                                    _orderMessageWithPaddingWidget(_realNameMessageWidget()),
                                    SizedBox(height: UISize.width(12))
                                ],
                            ),
                            _dealOrderWidget(),
                        ],
                    ),
                ),
            ),
        );
    }
}