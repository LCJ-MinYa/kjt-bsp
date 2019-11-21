import 'package:dio/dio.dart';
import 'package:kjt_bsp/config/appConfig.dart';

class HttpRequest{
    static baseHttpRequest(url, method, params) async{
        Response response;
        response = await Dio().post(
            AppConfig.apiBaseUrl + url,
            data: params
        );
        print(response.toString());
        return response;
    }

    static post(url, params){
        return baseHttpRequest(url, 'POST', params);
    }
}