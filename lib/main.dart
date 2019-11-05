import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './router/app.dart';

void main(){
    runApp(App());
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    if(Platform.isAndroid){
        SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
}
