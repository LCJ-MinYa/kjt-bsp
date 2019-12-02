import 'package:dio/dio.dart';
import 'package:kjt_bsp/common/toast.dart';
import 'package:kjt_bsp/config/appConfig.dart';

class HttpRequest{
    static baseHttpRequest(url, method, params, successCallback, errorCallback) async{
        var dio = Dio(BaseOptions(
            baseUrl: AppConfig.apiBaseUrl,
            connectTimeout: AppConfig.requestTimeout,
            receiveTimeout: AppConfig.receiveTimeout
        ));

        Response response;
        DioError errorResponse;
        try{
            if(method == 'GET'){
                if (params != null && params.isNotEmpty) {
                    response = await dio.get(url, queryParameters: params);
                } else {
                    response = await dio.get(url);
                }
            }else if(method == 'POST'){
                response = await dio.post(url, data: params);  
            }
        }on DioError catch(error){
            errorResponse = error;
        }

        await Future.delayed(Duration(seconds: 2));
        if(successCallback != null && response != null){
            successCallback(response.data);
        }

        if(errorCallback == null && errorResponse != null){
            toast(errorResponse.message);
        }
        if(errorCallback != null && errorResponse != null){
            errorCallback(errorResponse);
        }
    }

    static postWithoutToken(url, params, [successCallback, errorCallback]){
        return baseHttpRequest(url, 'POST', params, successCallback, errorCallback);
    }

    static getWithoutToken(url, params, [successCallback, errorCallback]){
        return baseHttpRequest(url, 'GET', params, successCallback, errorCallback);
    }
}