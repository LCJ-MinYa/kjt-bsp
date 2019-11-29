import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:kjt_bsp/widget/layout/emptyWidget.dart';
import 'package:kjt_bsp/widget/layout/firstLoadingWidget.dart';

/*
 * 上拉加载下拉刷新组件
 */
class RefreshList extends StatefulWidget {
    final Function child;               //列表item
    final Function onRefresh;           //下拉刷新
    final Function onLoad;              //上拉加载

    RefreshList({
        Key key,
        @required this.child,
        this.onRefresh,
        this.onLoad
    }) : super(key: key);
    
    @override
    _RefreshListState createState() => _RefreshListState();
}

class _RefreshListState extends State<RefreshList> {
    EasyRefreshController _controller;
    ScrollController _scrollController;

    // 震动
    bool _vibration = false;
    // 顶部回弹
    bool _topBouncing = true;
    // 底部回弹
    bool _bottomBouncing = true;
    //空视图显示状态
    bool _showEmptyWidget = false;
    //当前请求页数
    int _pageIndex = 1;
    //是否还有更多数据
    bool _noMore = true;
    //当前页面数据来源
    List _data = [];

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
            onLoad: widget.onLoad != null && _data.length != 0 ? _doLoad: null,
            slivers: <Widget>[
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index){
                        return widget.child(_data[index], index);
                    },childCount: _data.length),
                )
            ],
            header: ClassicalHeader(
                enableInfiniteRefresh: false,
                refreshText: '下拉刷新',
                refreshReadyText: '释放刷新',
                refreshingText: '正在刷新',
                refreshedText: '刷新完成',
                refreshFailedText: '刷新失败',
                noMoreText: '没有更多数据...',
                infoText: '更新于 %T',
                infoColor: Color(0xff666666),
                enableHapticFeedback: _vibration,
            ),
            footer: ClassicalFooter(
                enableInfiniteLoad: true,
                loadText: '上拉加载',
                loadReadyText: '释放加载',
                loadingText: '正在加载',
                loadedText: '加载完成',
                loadFailedText: '加载失败',
                noMoreText: '没有更多数据...',
                showInfo: false,
                enableHapticFeedback: _vibration,
            ),
            firstRefresh: true,
            firstRefreshWidget: FirstLoadingWidget(),
            emptyWidget: _data.length == 0 ? EmptyWidget(isShow: _showEmptyWidget) : null,
        );
    }

    Future _doRefresh() async{
        //下拉刷新时取消空视图显示
        if(_showEmptyWidget){
            setState(() {
                _showEmptyWidget = false;
            });
        }

        //初始化请求页码
        if(_pageIndex != 1){
            _pageIndex = 1;
        }
        //发送请求
        await widget.onRefresh(_pageIndex, (data, noMore){
            setState(() {
                _data = data;
                _noMore = noMore;
            });
            _controller.resetLoadState();
            _controller.finishRefresh();
        });
        //请求成功页码加一
        _pageIndex++;
        
        //下拉刷新成功后如果数据为空显示空视图
        if(_data.length == 0 && !_showEmptyWidget){
            setState(() {
                _showEmptyWidget = true;
            });
        }
    }

    Future _doLoad() async{
        //如果当前数据只有一页
        if(_noMore){
            _controller.finishLoad(noMore: _noMore);
            return;
        }

        //发送请求
        await widget.onLoad(_pageIndex, (data, noMore){
            setState(() {
                _noMore = noMore;
                _data += data;
            });
            _controller.finishLoad(noMore: noMore);
        });
        //请求成功页码加一
        _pageIndex++;
    }
}