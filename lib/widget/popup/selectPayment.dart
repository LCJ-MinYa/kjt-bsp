import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/tap/platformTapWidget.dart';

showSelectPayment(BuildContext context){
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context){
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
                                children: <Widget>[
                                    Text('支付方式'),
                                    PlatformTapWidget(
                                        child: Icon(Icons.close),
                                    )
                                ],
                            ),
                            Container(
                                height: UISize.width(100),
                                child:ListView.builder(
                                    itemCount: 2,
                                    itemBuilder: (context, index){
                                        return Text('123');
                                    },
                                ), 
                            ),
                        ],
                    ),
                ),
            );
        }
    );   
}