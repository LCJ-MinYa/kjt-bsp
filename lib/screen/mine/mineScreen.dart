import 'package:flutter/material.dart';
import '../../widget/tap/platformTapWidget.dart';
import '../../styles/uiSize.dart';

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

    /* 姓名头像 */
    Widget _userMessage(){
        return Container(
            width: UISize.getScreenWidth(),
            height: UISize.height(400),
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
                                fontSize: UISize.width(36)
                            ),
                        ), 
                    ),
                ],
                ),
        );
    }

    /* 我的信息 */
    Widget _mineMessage(){
        return PlatformTapWidget(
            opacity: 1,
            child: Container(
                width: UISize.width(UISize.getScreenWidth() * 2 - 64),
                height: UISize.height(120),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(UISize.width(16))),
                    boxShadow: [
                        BoxShadow(
                            color: Color(0xffcccccc),
                            offset: Offset(0, 4),
                            blurRadius: 8
                        ),
                    ],
                ),
            ),
            onTap: (){
                print(1);
                Navigator.pushNamed(context, '/mineMessage');
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
                    right: UISize.width(35),
                    top: UISize.height(64),
                    child: PlatformTapWidget(
                        child: Image.asset(
                            _userData['setting'],
                            width: UISize.width(40),
                            height: UISize.width(40),
                            fit: BoxFit.cover,
                        ),
                        onTap: (){
                            print("111");
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

    @override
    Widget build(BuildContext context) {
        UISize.init(context);
        return Column(
            children: <Widget>[
                _userInfo(),
            ],
        );
    }
}