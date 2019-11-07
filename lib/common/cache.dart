import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:kjt_bsp/common/toast.dart';

class Cache{
    //加载缓存
    static Future loadCache() async {
        try {
            Directory tempDir = await getTemporaryDirectory();
            double value = await _getTotalSizeOfFilesInDir(tempDir);
            /*tempDir.list(followLinks: false,recursive: true).listen((file){
                //打印每个缓存文件的路径
                print(file.path);
            });*/
            return _renderSize(value);
        } catch (err) {
            return _renderSize(0);
        }
    }

    //格式化文件大小
    static _renderSize(double value) {
        if (null == value) {
            return 0;
        }
        List<String> unitArr = List()
            ..add('B')
            ..add('K')
            ..add('M')
            ..add('G');
        int index = 0;
        while (value > 1024) {
            index++;
            value = value / 1024;
        }
        String size = value.toStringAsFixed(2);
        return size + unitArr[index];
    }

    // 递归方式 计算文件的大小
    static Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
        try {
            if (file is File) {
                    int length = await file.length();
                    return double.parse(length.toString());
                }
            if (file is Directory) {
                    final List<FileSystemEntity> children = file.listSync();
                    double total = 0;
                    if (children != null)
                    for (final FileSystemEntity child in children)
                        total += await _getTotalSizeOfFilesInDir(child);
                    return total;
                }
            return 0;
        } catch (e) {
            if(e.runtimeType == FileSystemException){
                print('递归方式计算文件的大小, 目录不存在(已清除过缓存)');
            }
            return 0;
        }
    }

    static clearCache() async{
        Directory tempDir = await getTemporaryDirectory();
        //删除缓存目录
        await delDir(tempDir);
        toast('清除缓存成功');
    }

    //递归方式删除目录
    static Future<Null> delDir(FileSystemEntity file) async {
        try{
            if (file is Directory) {
                final List<FileSystemEntity> children = file.listSync();
                for (final FileSystemEntity child in children) {
                    await delDir(child);
                }
            }
            await file.delete();
        }catch(e){
            if(e.runtimeType == FileSystemException){
                print('递归方式删除目录, 目录不存在(已清除过缓存)');
            }
        }
    }
}