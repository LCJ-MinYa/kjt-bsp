import 'package:flutter/material.dart';
import 'package:kjt_bsp/controller/order.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/animation/slideAnimationWidget.dart';
import 'package:kjt_bsp/widget/cell/containerCellWidget.dart';
import 'package:kjt_bsp/widget/input/textFieldWidget.dart';
import 'package:kjt_bsp/widget/list/refreshScreen.dart';
import 'package:kjt_bsp/widget/text/appBarTextWidget.dart';

class AddProductScreen extends StatefulWidget {
    @override
    _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
    bool _searchState = false;
    List _searchList = [
        '口红',
        '狗粮',
        '爽肤水',
        '防晒霜',
        '太阳眼镜',
        '科颜氏精华50ML',
        '口红',
        '狗粮',
        '爽肤水',
        '防晒霜',
        '太阳眼镜',
        '科颜氏精华50ML'
    ];

    /* 搜索框 */
    Widget _searchWidget(){
        return ContainerCellWidget(
            child: Padding(
                padding: EdgeInsets.only(
                    top: UISize.height(20),
                    bottom: UISize.height(20)
                ),
                child: Container( 
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: UISize.width(1),
                            color: Color(0xffE0E4E6)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(UISize.width(4)))
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            Container(
                                width: UISize.width(56),
                                height: double.infinity,
                                padding: EdgeInsets.all(UISize.width(16)),
                                child: Icon(
                                    Icons.search,
                                    size: UISize.size(30),
                                    color: Color(0xff333333),
                                ),
                            ),
                            TextFieldWidget(
                                hintText: '搜索商品名称',
                                fontSize: 24,
                                onSubmitted: _submitSearchVaule,
                            )
                        ],
                    ),
                ),
            ),
        );
    }

    /* 历史搜索List */
    List<Widget> _renderSearchListWidget(){
        List<Widget> _searchListWidget = [];
        for (var item in _searchList) {
            _searchListWidget.add(
                Padding(
                    padding: EdgeInsets.only(
                        right: UISize.width(24),
                        bottom: UISize.width(24)
                    ),
                    child: Container(
                        padding: EdgeInsets.only(
                            left: UISize.width(12),
                            right: UISize.width(12),
                            top: UISize.width(8),
                            bottom: UISize.width(8)
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffe0e4e6),
                            borderRadius: BorderRadius.all(Radius.circular(UISize.width(8)))
                        ),
                        child: Text(
                            item,
                            style: TextStyle(
                                fontSize: UISize.size(24),
                                color: Color(0xff333333)
                            ),
                        ),
                    ),
                )
            ); 
        }
        return _searchListWidget;
    }

    /* 历史搜索 */
    Widget _historySearchWidget(){
        return Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
                children: <Widget>[
                    ContainerCellWidget(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                                Text(
                                    '历史搜索',
                                    style: TextStyle(
                                        color:Color(0xff333333),
                                        fontSize: UISize.size(28)
                                    ),
                                ),
                                Icon(
                                    Icons.delete,
                                    color: Color(0xffb3b3b3),
                                    size: UISize.size(36),
                                )
                            ],
                        ),            
                    ),
                    Container(
                        width: double.infinity,
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            left: UISize.width(32),
                            right: UISize.width(32),
                            bottom: UISize.width(8)
                        ),
                        child: Wrap(
                            children: _renderSearchListWidget(),
                        ),
                    )
                ],
            ),
        );
    }

    /* 搜索结果item */
    Widget _productItemWidget(item, index){
        return Text(item['productName']);
    }

    /* 搜索结果 */
    Widget _searchResultWidget(){
        return RefreshList(
            child: _productItemWidget,
            onRefresh: searchProduct,
            onLoad: searchProduct,
        );
    }

    /* 搜索内容 */
    Widget _searchContentWidget(){
        return Expanded(
            child: AnimatedSwitcher(
                transitionBuilder: (Widget child, Animation<double> animation) {
                    var tween;
                    if(_searchState){
                        tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                    }else{
                        tween = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0));
                    }
                    return SlideAnimationWidget(
                        child: child,
                        position: tween.animate(animation),
                    );
                },
                duration: Duration(milliseconds: 300),
                child: _searchState ? _searchResultWidget() : _historySearchWidget(),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                elevation: 0.0,
                title: AppBarTextWidget(title: '添加商品'),
            ),
            body: Column(
                children: <Widget>[
                    _searchWidget(),
                    SizedBox(height: UISize.width(12)),
                    _searchContentWidget(),
                ],
            ),
        );
    }

    //提交搜索
    _submitSearchVaule(val){
        setState(() {
            _searchState = val == '' ? false : true;
        });
    }
}