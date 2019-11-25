import 'package:fluttertoast/fluttertoast.dart';

toast(msg){
	Fluttertoast.showToast(
		msg: msg,
		toastLength: Toast.LENGTH_SHORT,
		timeInSecForIos: 3,
		fontSize: 16.0
	);
}
