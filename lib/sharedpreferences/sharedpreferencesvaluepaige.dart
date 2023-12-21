import 'package:shared_preferences/shared_preferences.dart';

var message1 = "";

void savedvalue (token)async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // print("sharedPreferences*********${sharedPreferences}");
  sharedPreferences.setString("token", token);
 

}
