import 'package:flutter/material.dart';
import 'package:kjt_bsp/config/appConfig.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/tap/platformTapWidget.dart';

showSelectPayment(BuildContext context){
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context){
            return SelectPaymentWidget();
        }
    ); 
}

class SelectPaymentWidget extends StatefulWidget {
    @override
    _SelectPaymentWidgetState createState() => _SelectPaymentWidgetState();
}

class _SelectPaymentWidgetState extends State<SelectPaymentWidget> {
    String _paymentStatus = 'select';

    /* 支付方式content */
    Widget _paymentContentWidget(){
        return Column(
            children: <Widget>[
                _paymentCellWidget('alipay.png', '支付宝', _showPaySuccessWidget),
                _paymentCellWidget('wechat.png', '微信支付', _showPayFailedWidget),
            ], 
        );
    }

    /* 支付方式cell */
    Widget _paymentCellWidget(imgName, title, onTap){
        return PlatformTapWidget(
            onTap: onTap,
            child: Container(
                width: double.infinity,
                height: UISize.width(96),
                child: Row(
                    children: <Widget>[
                        Image.asset(
                            AppConfig.orderImgUrl + imgName,
                            width: UISize.width(40),
                            height: UISize.width(40),
                            fit: BoxFit.cover,
                        ),
                        SizedBox(width: UISize.width(32)),
                        Text(
                            title,
                            style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: UISize.size(28)
                            ),
                        )
                    ],
                ),
            ),
        );
    }

    /* 支付成功 */
    Widget _paySuccessWidget(){
        return Container(
            width: double.infinity,
            height: UISize.width(400),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Icon(
                        Icons.check_circle_outline,
                        color: Color(0xff02cb02),
                        size: UISize.size(200),
                    ),
                    SizedBox(height: UISize.height(10)),
                    Text(
                        '付款成功',
                        style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: UISize.size(30)
                        ),
                    )
                ],
            ) 
        );
    }

    /* 支付失败 */
    Widget _payFailedWidget(){
        return Container(
            width: double.infinity,
            height: UISize.width(480),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Icon(
                        Icons.highlight_off,
                        color: Color(0xffb3b3b3),
                        size: UISize.size(200),
                    ),
                    SizedBox(height: UISize.height(10)),
                    Text(
                        '付款失败',
                        style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: UISize.size(30)
                        ),
                    ),
                    SizedBox(height: UISize.height(30)),
                    PlatformTapWidget(
                        onTap: _showPaymentContentWidget,
                        child: Container(
                            alignment: Alignment.center,
                            width: UISize.width(160),
                            height: UISize.width(60),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(UISize.width(60))),
                                color: Color(0xff0D9AFF)
                            ),
                            child: Text(
                                '重新支付',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: UISize.size(28)
                                ),
                            ),
                        ),
                    )
                ],
            ) 
        );
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.only(left: UISize.width(32)),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
            ),
            child: SafeArea(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                                Text(
                                    '支付方式',
                                    style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: UISize.size(32),
                                        fontWeight: FontWeight.bold
                                    ),
                                ),
                                PlatformTapWidget(
                                    onTap: (){
                                        Navigator.of(context).pop();
                                    },
                                    child: Icon(
                                        Icons.cancel,
                                        color: Color(0xffe0e4e6),
                                        size: UISize.size(42),
                                    ),
                                )
                            ],
                        ),
                        AnimatedSwitcher(
                            transitionBuilder: (child, animation){
                                return ScaleTransition(child: child, scale: animation);
                            },
                            duration: Duration(milliseconds: 300),
                            child: _showPaymentWithStatus(),
                        )
                    ],
                ),
            ),
        );
    }

    //控制当前显示内容
    _showPaymentWithStatus(){
        switch(_paymentStatus){
            case 'select':
                return _paymentContentWidget();
            case 'success':
                return _paySuccessWidget();
            case 'failed':
                return _payFailedWidget();
            default:
                return _paymentContentWidget();
        }
    }

    //显示支付方式列表
    _showPaymentContentWidget(){
        setState((){
            _paymentStatus = 'select';
        });
    }

    //显示支付成功
    _showPaySuccessWidget(){
        setState((){
            _paymentStatus = 'success';
        });
    }

    //显示支付失败
    _showPayFailedWidget(){
        setState((){
            _paymentStatus = 'failed';
        });   
    }
}