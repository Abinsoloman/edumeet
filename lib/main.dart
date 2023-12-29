import 'dart:async';
import 'package:dio/dio.dart';
import 'package:edumeetabin/forgotpassword.dart';
import 'package:edumeetabin/home/homepaige.dart';
import 'package:edumeetabin/api&url/apiclass.dart';
import 'package:edumeetabin/sharedpreferences/sharedpreferencesvaluepaige.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Loginpaige())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Edumeet",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Hedvig_Letters_Serif",
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class Loginpaige extends StatefulWidget {
  const Loginpaige({super.key});

  @override
  State<Loginpaige> createState() => _LoginpaigeState();
}

class _LoginpaigeState extends State<Loginpaige> {
  final username1 = TextEditingController();
  final password1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("asset/book_reading-removebg-preview.png"),
            Text(
              "Login",
              style: TextStyle(
                  fontSize: 50, fontWeight: FontWeight.w900, color: Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
              child: Theme(data: ThemeData(
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: Colors.black,
                )
              ),
                child: TextField(
                  controller: username1,
                  decoration: InputDecoration(
                      labelText: "Username", border: OutlineInputBorder()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: TextField(
                controller: password1,
                decoration: InputDecoration(
                    labelText: "Password", border: OutlineInputBorder()),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Forgotpaige()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text("Forgot password?"),
                )),
            SizedBox(
                height: 70,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      fetchposts1();
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePaige()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)))),
                  ),
                ))
          ],
        ),
      ])),
    );
  }

  void fetchposts1() async {
    final username = username1.text;
    final password = password1.text;
    if (username.isEmpty) {
      showerrormsg1("Username is empty");
    } else if (password.isEmpty) {
      showerrormsg1("Password is empty");
    } else {
      final frmdata1 =
          FormData.fromMap({"username": username, "password": password});

      final Response = await apiclass().loginuserapi(frmdata1);
 print("responce***********${Response}");
          if (Response != null){
            if (Response.status == 1){
              showsucessmsg1("Login Sucess");
              savedvalue(Response.message);
             next();
            }
          }else {
              showerrormsg1("Login Fails");
            }
    }
  }

  void showsucessmsg1(String msg) {
    MotionToast.success(
            description: Text(msg), position: MotionToastPosition.top,
            // dismissable: true,
            // animationDuration: Duration(microseconds: 10),
            )
        .show(context);
  }

  void showerrormsg1(String msg) {
    MotionToast.error(description: Text(msg), position: MotionToastPosition.top)
        .show(context);
  }
  next(){
    return Future.delayed(Duration(seconds:4),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePaige()));
    });
  }
}