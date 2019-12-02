import 'dart:convert';

import 'package:kjt_bsp/common/httpRequest.dart';
import 'package:kjt_bsp/config/apiConfig.dart';

Future getOrderList(params, callback) async{
    await HttpRequest.postWithoutToken(ApiConfig.orderList, params, (result) {
        callback(json.decode(json.encode(result['data'])), json.decode(json.encode(result['noMore'])));
    });
}

Future searchProduct(params, callback) async{
    await HttpRequest.postWithoutToken(ApiConfig.productSearch, params, (result) {
        callback(json.decode(json.encode(result['data'])), json.decode(json.encode(result['noMore'])));
    });
}