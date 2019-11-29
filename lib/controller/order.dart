import 'dart:convert';

import 'package:kjt_bsp/common/httpRequest.dart';
import 'package:kjt_bsp/config/apiConfig.dart';

Future getOrderList(pageIndex, callback) async{
    await HttpRequest.postWithoutToken(ApiConfig.orderList, {
        'pageIndex': pageIndex
    }, (result) {
        callback(json.decode(json.encode(result['data'])), json.decode(json.encode(result['noMore'])));
    });
}

Future searchProduct(pageIndex, callback) async{
    await HttpRequest.postWithoutToken(ApiConfig.productSearch, {
        'pageIndex': pageIndex
    }, (result) {
        callback(json.decode(json.encode(result['data'])), json.decode(json.encode(result['noMore'])));
    });
}