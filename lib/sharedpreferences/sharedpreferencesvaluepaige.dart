import 'package:shared_preferences/shared_preferences.dart';

//var message1 = "";

void savedvalue (token)async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // print("sharedPreferences*********${sharedPreferences}");
  sharedPreferences.setString("token", token);
}
var studentimage = "";
void studentimagevalue (studentimage)async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("studentimage", studentimage);
  studentimageget();
}
void studentimageget()async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  studentimage = sharedPreferences.getString("studentimage")!;
}
var parentimage ="";
void parentimagevalue (parentimage)async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("parentimage", parentimage);
  parentimageget();
}
void parentimageget ()async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  parentimage = sharedPreferences.getString("parentimage")!;
}

