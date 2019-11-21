import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:kjt_bsp/widget/text/appBarTextWidget.dart';

class RefreshScreen extends StatefulWidget {
    @override
    RefreshScreenState createState() => RefreshScreenState();
}

class RefreshScreenState extends State<RefreshScreen> {
    String title;
    Widget child;

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

    /* 页面刷新容器 */
    Widget refreshWidget(){
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
                        return renderChildItem(index);
                    },childCount: _count),
                )
            ],
        );
    }

    /* 列表项组件 */
    Widget renderChildItem(index){
        return null;
    }

    @override
    Widget build(BuildContext context) {
        if(title != null){
            return Scaffold(
                appBar: AppBar(
                    title: AppBarTextWidget(title: title),
                ),
                body: refreshWidget(),
            );
        }else{
            return refreshWidget();     
        }
    }
}