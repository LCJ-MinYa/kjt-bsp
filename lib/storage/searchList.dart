import 'dart:convert';

import 'package:kjt_bsp/common/storage.dart';

final String searchListKey = 'searchList';
class SearchListStorage{

    static addValueToStorage(value, data) async{
        data.insert(0, value);
        await Storage.setString(searchListKey, json.encode(data));
    }

    static setData(value) async{
        var data = await Storage.getString(searchListKey);
        if(data != null){
            data = json.decode(data);
            var hasData = data.any((v){
                return v == value;
            });

            //当前值并未被存储过
            if(!hasData){
                addValueToStorage(value, data);
            }
        }else{
            //没有数据，新建数组写入
            addValueToStorage(value, []);
        }
    }

    static getData() async{
        var data = await Storage.getString(searchListKey);
        if(data != null){
            return json.decode(data);
        }else{
            return [];
        }
    }

    static removeData() async{
        await Storage.remove(searchListKey);
    }
}