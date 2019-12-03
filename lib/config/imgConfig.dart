import 'appConfig.dart';

class ImgConfig{
    //公用二级图片地址
    static _hasBaseImgurl(name){
        return '${AppConfig.baseImgUrl}$name/';
    }

    //公用三级订单图片地址
    static _hasMainImgurl(name){
        return '$mainImgUrl$name';
    }

    //公用三级订单图片地址
    static _hasOrderImgurl(name){
        return '$orderImgUrl$name';
    }

    static final String mainImgUrl = _hasBaseImgurl('main');
    static final String mineImgUrl = _hasBaseImgurl('mine') ;
    static final String loginImgUrl = _hasBaseImgurl('login');
    static final String launchImgUrl = _hasBaseImgurl('launch');
    static final String orderImgUrl = _hasBaseImgurl('order');

    //启动图
    static final String launch = '${launchImgUrl}LaunchImage.png';

    //主页和通用
    static final String mainBanner1 = _hasMainImgurl('banner1.jpg');
    static final String mainBanner2 = _hasMainImgurl('banner2.jpg');
    static final String mainBanner3 = _hasMainImgurl('banner3.jpg');
    static final String mainQuickStart = _hasMainImgurl('quick_start.png');
    static final String mainLatestNotice = _hasMainImgurl('latest_notice.png');
    static final String mainOrderEntry = _hasMainImgurl('order_entry.png');
    static final String mainDataCenter = _hasMainImgurl('data_center.png');
    static final String emptyData = _hasMainImgurl('empty_data.png');

    //登录页面
    static final String loginBanner = '${loginImgUrl}banner.png';

    //订单
    static final String orderAlipay = _hasOrderImgurl('alipay.png');
    static final String orderWechat = _hasOrderImgurl('wechat.png');
    static final String orderPay = _hasOrderImgurl('pay.png');
    static final String orderPaid = _hasOrderImgurl('paid.png');
    static final String orderInvalid = _hasOrderImgurl('invalid.png');
    static final String orderNo = _hasOrderImgurl('orderNo.png');
    static final String orderProduct = _hasOrderImgurl('product.png');
}