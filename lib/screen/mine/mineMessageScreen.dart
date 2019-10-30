import 'package:flutter/material.dart';

class MineMessageScreen extends StatefulWidget {
    @override
    _MineMessageScreenState createState() => _MineMessageScreenState();
}

class _MineMessageScreenState extends State<MineMessageScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('我的信息'),
            ),
            body: Text('mine message')
        );
    }
}