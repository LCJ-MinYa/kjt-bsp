import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:kjt_bsp/config/imgConfig.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/button/smallDealButtonWidget.dart';
import 'package:kjt_bsp/widget/order/orderPriceWidget.dart';
import 'package:kjt_bsp/widget/order/orderProductListWidget.dart';
import 'package:kjt_bsp/widget/popup/alertDialog.dart';
import 'package:kjt_bsp/widget/popup/selectPayment.dart';
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

    EasyRefreshController _controller;
    ScrollController _scrollController;

    // 条目总数
    int _count = 5;
    // 反向
    bool _reverse = false;
    // 方向
    Axis _direction = Axis.vertical;
    // Header浮动
    bool _headerFloat = false;
    // 无限加载
    bool _enableInfiniteLoad = true;
    // 控制结束
    bool _enableControlFinish = false;
    // 任务独立
    bool _taskIndependence = false;
    // 震动
    bool _vibration = true;
    // 是否开启刷新
    bool _enableRefresh = true;
    // 是否开启加载
    bool _enableLoad = true;
    // 顶部回弹
    bool _topBouncing = true;
    // 底部回弹
    bool _bottomBouncing = true;

    @override
    void initState() {
        super.initState();
        _controller = EasyRefreshController();
        _scrollController = ScrollController();
    }

    /* 订单号 */
    Widget _orderNoWidget(index){
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
    Widget _orderItemWidget(index){
        String imgUrl;
        switch(_allOrderList[index]['status']){
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
                            _goOrderDetailScreen(_allOrderList[index]['orderNo']);
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
                                    _orderNoWidget(index),
                                    OrderProductListWidget(orderMessage: _allOrderList[index]),
                                    OrderPriceWidget(orderMessage: _allOrderList[index]),
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

        return EasyRefresh.custom(
            controller: _controller,
            scrollController: _scrollController,
            topBouncing: _topBouncing,
            bottomBouncing: _bottomBouncing,
            onRefresh: _enableRefresh ? () async {
                await Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                        _count = 5;
                    });
                    if (!_enableControlFinish) {
                        _controller.resetLoadState();
                        _controller.finishRefresh();
                    }
                });
            }: null,
            onLoad: _enableLoad ? () async {
                await Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                        _count += 5;
                    });
                    if (!_enableControlFinish) {
                        _controller.finishLoad(noMore: _count >= 80);
                    }
                });
            }: null,
            slivers: <Widget>[
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index){
                            return _orderItemWidget(2);
                    },childCount: _count),
                )
            ],  
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