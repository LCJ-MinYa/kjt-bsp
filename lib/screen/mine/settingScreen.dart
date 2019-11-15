import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kjt_bsp/common/cache.dart';
import 'package:kjt_bsp/common/toast.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:kjt_bsp/widget/cell/nameCellWidget.dart';
import 'package:kjt_bsp/widget/text/appBarTextWidget.dart';
import '../../widget/popup/alertDialogWidget.dart';

class SettingScreen extends StatefulWidget {
    @override
    _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
    String _cacheSizeStr; 

    @override
    void initState() {
        super.initState();
        _initCacheSize();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: AppBarTextWidget(title: '设置'),
            ),
            body: Column(
                children: <Widget>[
                    NameCellWidget(
                        value: '修改密码',
                        onTap: (){
                            Navigator.pushNamed(context, '/modifyPwd');
                        },
                    ),
                    NameCellWidget(
                        showBottomBorder: false,
                        value: '清除缓存',
                        rightText: _cacheSizeStr,
                        onTap: () {
                            showAlertDialog(context, '清除缓存', '确认清除APP缓存信息吗？', _confirmClearCache);
                        },
                    ),
                    SizedBox(height: UISize.height(12)),
                    NameCellWidget(
                        value: '退出登录',
                        valueTextStyle: TextStyle(fontSize: UISize.size(28)),
                        showBottomBorder: false,
                        onTap: (){
                            showAlertDialog(context, '退出登录', '确认退出APP登录吗？', () async{
                                
                            });
                        },
                    ),
                ],
            ),
        );
    }

    //初始化缓存大小
    _initCacheSize() async{
        _cacheSizeStr = await Cache.loadCache();
        setState(() {
            _cacheSizeStr = _cacheSizeStr;
        });
    }

    //确认开始清除缓存
    _confirmClearCache() async{
        if(_cacheSizeStr == '0.00B'){
            toast('暂无更多缓存清理啦~');
            return;
        }
        await Cache.clearCache();
        _cacheSizeStr = await Cache.loadCache();
        setState(() {
            _cacheSizeStr = _cacheSizeStr;
        }); 
    }
}