import 'package:flutter/material.dart';

class ThemeConfig{
    static ThemeData themeData(){
        return ThemeData(
            scaffoldBackgroundColor: Color(0xfff5f5f5), //所有页面通用背景颜色
            buttonColor: Color(0xff0d9aff), //按钮背景颜色
            accentTextTheme: TextTheme(
                //默认文本样式
                title: TextStyle(color: Color(0xff0d9aff), fontSize: 14.0)),
            splashColor: Colors.white,
            primaryColor: Color(0xff0d9aff),
            primaryColorLight: Color(0xff333333),
            appBarTheme: AppBarTheme(
                color: Colors.white,
                iconTheme: IconThemeData(
                    color: Color(0xff373737)
                ),
                textTheme: TextTheme(
                    title: TextStyle(
                        color: Color(0xff373737),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    )
                ),
                brightness: Brightness.light
            ),
            inputDecorationTheme: InputDecorationTheme( //输入框
                
            ),
            // cursorColor: Colors.red
        );
    }
}