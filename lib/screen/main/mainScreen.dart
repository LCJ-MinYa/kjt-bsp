import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:kjt_bsp/config/imgConfig.dart';
import 'package:kjt_bsp/widget/tap/platformTapWidget.dart';
import '../../styles/uiSize.dart';

class MainScreen extends StatefulWidget {
    @override
    MainScreenState createState() => new MainScreenState();
}

class MainScreenState extends State<MainScreen> with AutomaticKeepAliveClientMixin{
    @override
    //true表示页面保持状态
    bool get wantKeepAlive => true;
    
    final List _bannerImgList = [
        ImgConfig.mainBanner1,
        ImgConfig.mainBanner2,
        ImgConfig.mainBanner3,
    ];

    final List<Map> _moduleList = [{
        'url': ImgConfig.mainQuickStart,
        'name': '快速入门'
    },{
        'url': ImgConfig.mainLatestNotice,
        'name': '最新通知'
    },{
        'url': ImgConfig.mainOrderEntry,
        'name': '录入订单',
        'screen': '/orderEntry'
    },{
        'url': ImgConfig.mainDataCenter,
        'name': '数据中心'
    },{
        'url': ImgConfig.mainQuickStart,
        'name': '支付订单'
    }];

    /* MainBanner 固定宽高比375*200组件 */
    Widget _banner(){
        return new AspectRatio(
            child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                    return new Image.asset(
                        _bannerImgList[index],
                        fit: BoxFit.cover,
                    );
                },
                itemCount: _bannerImgList.length,
                pagination: new SwiperPagination(),
            ),
            aspectRatio: 375/200,
        );   
    }

    /* MainModule 单个模块组件 */
    Widget _moduleItem(index){
        return PlatformTapWidget(
            onTap: (){
                if(_moduleList[index]['screen'] != null){
                    Navigator.pushNamed(context, _moduleList[index]['screen']);
                }
            },
            child: Container(
                width: UISize.width(140),
                height: double.infinity,
                margin: EdgeInsets.only(left: UISize.width(32), right: index == _moduleList.length - 1 ? UISize.width(32) : 0),
                alignment: Alignment(0, 0),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(UISize.width(8)))
                ),
                child: Column(
                    children: <Widget>[
                        Container(
                            width: UISize.width(80),
                            height: UISize.height(80),
                            alignment: Alignment(0, 0),
                            margin: EdgeInsets.only(
                                left: UISize.width(30),
                                right: UISize.width(30),
                                top: UISize.height(16),
                                bottom: UISize.height(8) 
                            ),
                            child: Image.asset(
                                _moduleList[index]['url'],
                                fit: BoxFit.cover,
                            ),
                        ),
                        Text(
                            _moduleList[index]['name'],
                            style: TextStyle(
                                fontSize: UISize.size(24),
                                color: Color(0xff666666)
                            ),
                        )
                    ],
                ),
            ),
        );
    }

    /* MainModule 所有模块组件 */
    Widget _module(){
        return Container(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                    return _moduleItem(index);
                },
                itemCount: _moduleList.length,
            ),
            height: UISize.height(200),
            padding: EdgeInsets.only(top: UISize.height(32)),
        );
    }

    /* placeholder组件 */
    Widget _placeholderWidget(){
        return Expanded(
            child: Padding(
                padding: EdgeInsets.all(UISize.width(32)),
                child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Text(
                        '数据展示',
                        style: TextStyle(
                            fontSize: UISize.size(24),
                            color: Color(0xff666666)
                        ),
                    ),
                ),
            ) 
        );
    }

    @override
    Widget build(BuildContext context) {
        super.build(context);

        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Scaffold(
                body: Column(
                    children: <Widget>[
                        _banner(),
                        _module(),
                        _placeholderWidget(),
                    ],
                ),
            ),
        );
    }
}
