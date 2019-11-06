import 'package:fluttertoast/fluttertoast.dart';

toast(msg){
	Fluttertoast.showToast(
		msg: msg,
		toastLength: Toast.LENGTH_SHORT,
		timeInSecForIos: 2,
		fontSize: 16.0
	);
}
