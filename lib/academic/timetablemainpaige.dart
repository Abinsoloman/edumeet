import 'package:edumeetabin/academic/timetablepaige1.dart';
import 'package:edumeetabin/academic/timetablepaige2.dart';
import 'package:edumeetabin/academic/timetablepaige3.dart';
import 'package:edumeetabin/academic/timetablepaige4.dart';
import 'package:edumeetabin/academic/timetablepaige5.dart';
import 'package:flutter/material.dart';

class TimeTablemainpaige extends StatelessWidget {
  const TimeTablemainpaige({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(253, 253, 253, 25),
        appBar: AppBar(
          title: Text(
            "Time Table Report",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.chat_outlined))
          ],
          backgroundColor: Colors.red,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Material(color: Color.fromRGBO(253, 253, 253, 25),
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabs: [
                Tab(text: "Monday",),
                 Tab(text: "Tuesday",),
              Tab(text: "Wednesday",),
               Tab(text: "Thursday",),
                 Tab(text: "Friday",)
              ],
              dividerColor: Colors.transparent,
              indicatorColor: Colors.white,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
              ),
              Expanded(
                child: TabBarView(children: [
                  Timetablepaige1(),
                  Timetablepaige2(),
                  Timetablepaige3(),
                  Timetablepaige4(),
                  Timetablepaige5()
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}