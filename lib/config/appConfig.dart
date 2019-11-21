import 'package:package_info/package_info.dart';

class AppConfig{
    //公用一级图片地址
    static final String baseImgUrl = 'lib/images/';

    //是否为正式环境
    static final bool isRelease = bool.fromEnvironment('dart.vm.product');

    //公用请求地址
    static final String apiBaseUrl = isRelease ? 'https://www.fastmock.site/mock/2ee9ed1c38d8955e6d014590824d76a9/api' : 'https://www.fastmock.site/mock/2ee9ed1c38d8955e6d014590824d76a9/api';
    //开发环境 https://www.fastmock.site/mock/2ee9ed1c38d8955e6d014590824d76a9/api
    //正式环境 https://www.fastmock.site/mock/2ee9ed1c38d8955e6d014590824d76a9/api

    //启动图过渡时间
    static final int launchImageTime = 2000;

    //请求超时时间
    static final int requestTimeout = 10000;

    //每页请求数据条数
    static final int pageSize = 10;

    //获取应用信息
    static Future getPackageInfo() async{
        PackageInfo packageInfo = await PackageInfo.fromPlatform();

        // String appName = packageInfo.appName;
        // String packageName = packageInfo.packageName;
        // String version = packageInfo.version;
        // String buildNumber = packageInfo.buildNumber;
        return packageInfo;
    }
}