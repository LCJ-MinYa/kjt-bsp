import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import '../../widget/tap/platformTapWidget.dart';
import 'package:image_picker/image_picker.dart';

class FeedbackScreen extends StatefulWidget {
    @override
    _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
    File _image;
    
    /* 输入意见反馈文本 */
    Widget _inputNotes(){
        return Container(
            width: double.infinity,
            height: UISize.height(460),
            padding: EdgeInsets.only(left: UISize.width(32), right: UISize.width(32)),
            color: Colors.white,
            child: TextField(
                maxLines: 13,
                maxLength: 100,
                decoration: InputDecoration(
                    hintText: '准确全面的描述有助于我们更快理解你的想法',
                    hintStyle: TextStyle(
                        color: Color(0xffb3b3b3),
                        fontSize: UISize.size(28)
                    ),
                    border: InputBorder.none
                ),
                style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: UISize.size(28)
                ),
                cursorColor: Color(0xff333333),
            )
        );
    }

    /* 选择照片 */
    Widget _imagePicker(){
        return Container(
            width: double.infinity,
            height: UISize.height(224),
            color: Colors.white,
            padding: EdgeInsets.only(left: UISize.width(32), right: UISize.width(32)),
            child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: UISize.width(1),
                            color: Color(0xffe0e4e6)
                        )
                    )
                ),
                child: PlatformTapWidget(
                    onTap: _getImagePiacker,
                    child: Container(
                        width: UISize.width(160),
                        height: UISize.width(160),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: UISize.width(1),
                                color: Color(0xffb3b3b3)
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        alignment: Alignment(0, 0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                Icon(Icons.camera_alt, size: UISize.size(64), color: Color(0xffb3b3b3),),
                                Text('照片', style: TextStyle(fontSize: UISize.size(24), color: Color(0xffb3b3b3)),),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        UISize.init(context);
        return Scaffold(
            appBar: AppBar(
                title: Text('意见反馈'),
            ),
            body: Stack(
                children: <Widget>[
                    ListView(
                        padding: EdgeInsets.only(top: UISize.height(12)),
                        children: <Widget>[
                            _inputNotes(),
                            _imagePicker(),
                        ],
                    ),
                    Positioned(
                        bottom: UISize.height(60),
                        left: UISize.width(105),
                        right: UISize.width(105),
                        child: PlatformTapWidget(
                            onTap: (){},
                            child: Container(
                                width: UISize.width(540),
                                height: UISize.height(88),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(13, 154, 255, 0.3),
                                    borderRadius: BorderRadius.all(Radius.circular(UISize.height(44)))
                                ),
                                child: Text('提交', style: TextStyle(color: Colors.white, fontSize: UISize.size(30)),),
                            ),
                        ),
                    ),
                ],
            ),
        );
    }

    Future _getImagePiacker() async{
        var image = await ImagePicker.pickImage(source: ImageSource.gallery);
        print(image);
    }
}