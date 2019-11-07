import 'package:flutter/material.dart';
import '../../styles/uiSize.dart';
import 'package:flutter/services.dart';
import '../../widget/cell/listTitleWidget.dart';
import '../../widget/tap/platformTapWidget.dart';

class MineScreen extends StatefulWidget {
    @override
    _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
    final Map _userData = {
        'avatar': 'lib/images/mine/avatar.png',
        'name': '请登录/姓名',
        'setting': 'lib/images/mine/setting.png'
    };

    final Map _mineMessageData = {
        'borderRadius': 16.0,
        'height': 120.0,
        'title': '我的信息',
        'iconName': 'lib/images/mine/mine_message.png'   
    };

    final List<Map> _cellList = [{
        'screenName': '/feedback',
        'title': '意见反馈',
        'iconName': 'lib/images/mine/feedback.png'
    },{
        'screenName': '/aboutUs',
        'title': '关于我们',
        'iconName': 'lib/images/mine/about_us.png'
    }];

    /* 姓名头像 */
    Widget _userMessage(){
        return PlatformTapWidget(
            opacity: 0.9,
            onTap: (){
                _goNextScreen('/login');
            },
            child: Container(
                width: UISize.getScreenWidth(),
                height: UISize.height(460),
                color: Color(0xff0d9aff),
                padding: EdgeInsets.only(left: UISize.width(32), top: UISize.height(100)),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Image.asset(
                            _userData['avatar'],
                            fit: BoxFit.cover,
                            width: UISize.height(120),
                            height: UISize.height(120),
                        ),
                        Container(
                            alignment: Alignment(0, 0),
                            height: UISize.height(120),
                            padding: EdgeInsets.only(left: UISize.width(12)),
                            child: Text(
                                _userData['name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: UISize.size(32)
                                ),
                            ), 
                        ),
                    ],
                    ),
            ),
        );
    }

    /* 我的信息 */
    Widget _mineMessage(){
        return PlatformTapWidget(
            opacity: 1,
            child: Container(
                width: UISize.width(686),
                height: UISize.height(120),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(UISize.width(16))),
                    boxShadow: [
                        BoxShadow(
                            color: Color(0xffcccccc),
                            offset: Offset(0, 4),
                            blurRadius: UISize.width(16)
                        ),
                    ],
                ),
                child: ListTitleWidget(
                    showBottomBorder: false,
                    borderRadius: _mineMessageData['borderRadius'],
                    height: _mineMessageData['height'],
                    title: _mineMessageData['title'],
                    iconName: _mineMessageData['iconName'],
                ),
            ),
            onTap: (){
                _goNextScreen('/mineMessage');
            },
        );
    }

    /* 顶部用户信息 */
    Widget _userInfo(){
        return Stack(
            overflow: Overflow.visible,
            alignment: Alignment.topLeft,
            children: <Widget>[
                _userMessage(),
                Positioned(
                    right: UISize.width(32),
                    top: UISize.height(64),
                    child: PlatformTapWidget(
                        child: Image.asset(
                            _userData['setting'],
                            width: UISize.width(40),
                            height: UISize.width(40),
                            fit: BoxFit.cover,
                        ),
                        onTap: (){
                            _goNextScreen('/setting');
                        },
                    ),
                ),
                Positioned(
                    left: 0,
                    bottom: 0,
                    width: UISize.getScreenWidth(),
                    height: UISize.height(90),
                    child: Container(
                        color: Colors.white,
                    ),
                ),
                Positioned(
                    left: UISize.width(32),
                    right: UISize.width(32),
                    bottom: UISize.height(30),
                    child: _mineMessage(),
                ),
            ],
        );
    }

    Widget _moreWidget(){
        List<Widget> _cellListWidget = [];
        Widget _cellContent;
        for (var item in _cellList) {
            _cellListWidget.add(
                ListTitleWidget(
                    onTap: (){
                        _goNextScreen(item['screenName']);
                    },
                    title: item['title'],
                    iconName: item['iconName'],
                )
            );
        }

        _cellContent = Column(
            children: _cellListWidget,
        );
        return _cellContent;
    }

    @override
    Widget build(BuildContext context) {
        UISize.init(context);

        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Column(
                children: <Widget>[
                    _userInfo(),
                    _moreWidget(),
                ],
            ),
        );
    }

    _goNextScreen(screenName){
        Navigator.pushNamed(context, screenName);
    }
}