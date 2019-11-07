import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../styles/uiSize.dart';
import '../../config/appConfig.dart';

class MainScreen extends StatefulWidget {
    @override
    MainScreenState createState() => new MainScreenState();
}

class MainScreenState extends State<MainScreen> with AutomaticKeepAliveClientMixin{
    @override
    //true表示页面保持状态
    bool get wantKeepAlive => true;
    
    final List _bannerImgList = [
        AppConfig.mainImgUrl + "banner1.jpg",
        AppConfig.mainImgUrl + "banner2.jpg",
        AppConfig.mainImgUrl + "banner3.jpg"
    ];

    final List<Map> _moduleList = [{
        'url': AppConfig.mainImgUrl + 'quick_start.png',
        'name': '快速入门'
    },{
        'url': AppConfig.mainImgUrl + 'latest_notice.png',
        'name': '最新通知'
    },{
        'url': AppConfig.mainImgUrl + 'order_entry.png',
        'name': '录入订单'
    },{
        'url': AppConfig.mainImgUrl + 'data_center.png',
        'name': '数据中心'
    },{
        'url': AppConfig.mainImgUrl + 'quick_start.png',
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
        return Container(
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

    @override
    Widget build(BuildContext context) {
        super.build(context);
        UISize.init(context);

        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Scaffold(
                body: Column(
                    children: <Widget>[
                        _banner(),
                        _module(),
                    ],
                ),
            ),
        );
    }
}
