// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Noticepaige extends StatefulWidget {
  String? data1;
  String? data2;
   Noticepaige({super.key,this.data1,this.data2});

  @override
  State<Noticepaige> createState() => _NoticepaigeState();
}

class _NoticepaigeState extends State<Noticepaige> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 253, 253, 25),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        title: Text(
          "Notice",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Container(
          height: 470,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text("Title"),
                  )),
              Align(
                  alignment: FractionalOffset.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,top: 10),
                    child: Text(widget.data1.toString()),
                  )),
              Divider(
                thickness: 0.0,
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              Align(
                  alignment: FractionalOffset.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text("Description"),
                  )),
              Container(
                height: 350,
                width: 330,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(widget.data2.toString()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}