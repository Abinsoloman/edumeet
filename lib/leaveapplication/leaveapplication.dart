import 'package:edumeetabin/leaveapplication/assignedleavepaige.dart';
import 'package:edumeetabin/leaveapplication/leaveapply.dart';
import 'package:flutter/material.dart';

class LeaveApplication extends StatefulWidget {
  int selectpaige;
   LeaveApplication({super.key,required this.selectpaige});

  @override
  State<LeaveApplication> createState() => _AssignedleavepaigeState();
}

class _AssignedleavepaigeState extends State<LeaveApplication>
    with SingleTickerProviderStateMixin {
  late TabController tcontroller;
  final List<String> titlelists = ["Assigned Leave", "Leave Apply"];
  late String currentTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentTitle = titlelists[0];
    tcontroller = TabController(
    initialIndex: widget.selectpaige,
      length: 2, vsync: this);

    tcontroller.addListener(changetitle);
  }

  void changetitle() {
    setState(() {
      currentTitle = titlelists[tcontroller.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 253, 253, 250),
      appBar: AppBar(
        title: Text(
          currentTitle,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.chat_outlined)),
        ],
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        bottom: TabBar(
          controller: tcontroller,
          tabs: [Tab(text: "Assigned Leave"), Tab(text: "Leave Apply")],
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
        ),
      ),
      body: TabBarView(
          controller: tcontroller,
          children: [Assignedleavepaige(), LeaveApply()]),
    );
  }
}