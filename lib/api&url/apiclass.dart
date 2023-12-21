// ignore_for_file: body_might_complete_normally_nullable

import 'package:dio/dio.dart';
import 'package:edumeetabin/model/detailsmodel.dart';
import 'package:edumeetabin/model/editprofile.dart';
import 'package:edumeetabin/model/profilemodel.dart';
import 'package:edumeetabin/api&url/url.dart';
import 'package:edumeetabin/model/loginmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class apiclass {

  apiclass.internal();
  static apiclass instance = apiclass.internal();
  factory (){
    return instance;
  }

  final dio = Dio();
  final url = URl();
  apiclass() {
    dio.options =
        BaseOptions(baseUrl: url.baseurl, responseType: ResponseType.json);
  }
  Future<loginmodel?> loginuserapi(FormData formData) async {
    try {
      final result = await dio.post(url.Loginurl, data: formData);
      return loginmodel.fromJson((result.data));
    } on DioException catch (e) {
      print(e);
    }
  }
  Future<profilemodel?>profileuserapi ()async{
    print("hello123");
    SharedPreferences share = await SharedPreferences.getInstance();
    var tok = share.getString("token");
    print("token${tok}");
    final result = await dio.get(url.baseurl + url.Profileurl,
    options: Options(headers:{
      "Content": "application/json",
      "Accepts" : "application/json",
      "Authorization": "Bearer $tok" 
    } )
    );
    print("hellloooooo${result}");
    return profilemodel.fromJson(result.data);
  }
 Future<detailsmodel?>detailuserapi ()async{
  SharedPreferences share = await SharedPreferences.getInstance();
  var tok = share.getString("token");
  final result = await dio.get(url.baseurl+url.Detailurl,
  options:Options(headers: {
    "Content": "application/json",
      "Accepts" : "application/json",
      "Authorization": "Bearer $tok"
  }));
  return detailsmodel.fromJson(result.data);
 }
 Future<editprofile?>editprofileuserapi(FormData formData)async{
  SharedPreferences share = await SharedPreferences.getInstance();
  var tok = share.getString("token");
  try{
    final result = await dio.post(url.editprofileurl,data: formData,
    options: Options(headers: {
      "Content": "application/json",
      "Accepts" : "application/json",
      "Authorization": "Bearer $tok"
    }));
    print("hellllllloooo${result}");
    return editprofile.fromJson((result.data));
  }on DioException catch (e){
    print(e);
  }
 }
}