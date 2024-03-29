package com.example.kjt_bsp;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

//引入需要调用资源
import android.view.KeyEvent;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    //通讯名称,回到手机桌面
	private  final String CHANNEL = "android/back/desktop";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        //定义方法
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
			new MethodChannel.MethodCallHandler() {
				@Override
				public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
					if (methodCall.method.equals("backDesktop")) {
						result.success(true);
						moveTaskToBack(false);
					} 
				}
			}
		);
    }
}
