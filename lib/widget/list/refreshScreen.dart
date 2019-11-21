import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class RefreshList extends StatefulWidget {
    final Function child;               //列表item
    final List data;                    //列表数据
    final Function onRefresh;           //下拉刷新
    final Function onLoad;              //上拉加载

    RefreshList({
        Key key,
        @required this.child,
        @required this.data,
        this.onRefresh,
        this.onLoad
    }) : super(key: key);
    
    @override
    _RefreshListState createState() => _RefreshListState();
}

class _RefreshListState extends State<RefreshList> {
    String title;
    Widget child;

    EasyRefreshController _controller;
    ScrollController _scrollController;

    // 控制结束
    bool _enableControlFinish = false;
    // 震动
    bool _vibration = true;
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

    @override
    Widget build(BuildContext context) {
        return EasyRefresh.custom(
            controller: _controller,
            scrollController: _scrollController,
            topBouncing: _topBouncing,
            bottomBouncing: _bottomBouncing,
            onRefresh: widget.onRefresh != null ? _doRefresh : null,
            onLoad: widget.onLoad != null ? _doLoad: null,
            slivers: <Widget>[
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index){
                        return widget.child(index);
                    },childCount: widget.data.length),
                )
            ],
        );
    }

    Future _doRefresh() async{
        await widget.onRefresh(true);
        if (!_enableControlFinish) {
            _controller.resetLoadState();
            _controller.finishRefresh();
        }
    }

    Future _doLoad() async{
        await widget.onLoad(false);
        if (!_enableControlFinish) {
            _controller.finishLoad(noMore: widget.data.length >= 9);
        }
    }
}