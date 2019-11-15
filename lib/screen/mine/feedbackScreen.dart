import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kjt_bsp/styles/uiSize.dart';
import 'package:image_picker/image_picker.dart';

import '../../widget/tap/platformTapWidget.dart';
import '../../widget/button/submitButton.dart';

class FeedbackScreen extends StatefulWidget {
    @override
    _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
    File _image;
    bool _disable = true;
    String _notes = '';
    
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
                onChanged: (val){
                    setState((){
                        _notes = val;
                    });
                    _toggleDisable();
                },
            ),
        );
    }

    /* 照片显示 */
    Widget _isShowImage(){
        if(_image == null){
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Icon(Icons.camera_alt, size: UISize.size(64), color: Color(0xffb3b3b3),),
                    Text('照片', style: TextStyle(fontSize: UISize.size(24), color: Color(0xffb3b3b3)),),
                ],
            );
        }else{
            return Stack(
                children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                            _image,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                        ),
                    ),
                    Positioned(
                        top: UISize.width(5),
                        right: UISize.width(10),
                        width: UISize.width(40),
                        height: UISize.width(40),
                        child: PlatformTapWidget(
                            onTap: (){
                                _updateImage(null);
                            },
                            child: Icon(
                                Icons.cancel,
                                color: Color(0xffb3b3b3),
                            ),
                        ),
                    ),
                ],
            );
        }
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
                                width: UISize.width(_image != null ? 0 : 1),
                                color: Color(0xffb3b3b3)
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        alignment: Alignment(0, 0),
                        child: _isShowImage()
                    ),
                ),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('意见反馈'),
            ),
            body: ListView(
                padding: EdgeInsets.only(top: UISize.height(12)),
                children: <Widget>[
                    _inputNotes(),
                    _imagePicker(),
                    Container(
                        margin: EdgeInsets.only(top: UISize.height(360)),
                        child: SubmitButton(
                            onTap: (){},
                            title: '提交',
                            disable: _disable,
                        ),
                    ),
                ],
            ),
        );
    }

    Future _getImagePiacker() async{
        var image = await ImagePicker.pickImage(source: ImageSource.gallery);
        if(image == null){
            return;
        }
        _updateImage(image);
    }

    _updateImage(image){
        setState(() {
            _image = image;
        });
        _toggleDisable();
    }

    _toggleDisable(){
        if(_notes != '' && _image != null && _disable){
            setState(() {
                _disable = false;
            });
        }
        if((_notes == '' || _image == null) && !_disable){
            setState(() {
                _disable = true;
            });
        }
    }
}