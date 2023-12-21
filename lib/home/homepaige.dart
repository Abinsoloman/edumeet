import 'package:edumeetabin/academic/subjectpaige.dart';
import 'package:edumeetabin/academic/timetablemainpaige.dart';
import 'package:edumeetabin/api&url/apiclass.dart';
import 'package:edumeetabin/personal/diarypaige.dart';
import 'package:edumeetabin/leaveapplication/leaveapplication.dart';
import 'package:edumeetabin/main.dart';
import 'package:edumeetabin/personal/myprofile.dart';
import 'package:edumeetabin/home/noticepaige.dart';
import 'package:edumeetabin/personal/staffdirectorypaige.dart';
import 'package:edumeetabin/home/textdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePaige extends StatefulWidget {
  const HomePaige({super.key});

  @override
  State<HomePaige> createState() => _HomePaigeState();
}

class _HomePaigeState extends State<HomePaige> {
  String studentimage = "";
  String parentimage = ""; 
  
  String userid = "";
  String firstnme = "";
  String middlenme = "";
  String lastnme = "";
  String regno = "";
  String cls = "";
  String rollno = "";
  String division = "";
  String dob = "";
  String parentfirstnme = "";
  String parentlastnme = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profilename();
    detailname();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 253, 253, 25),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chat_outlined,
                color: Colors.white,
              ))
        ],
        backgroundColor: Colors.red,
        elevation: 0,
        title: Center(
          child: Text(
            "Edumeet",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.red),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(55),
                          border: Border.all(color: Colors.white, width: 2)),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(studentimage),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Text(
                            "Hello",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            children: [
                              Text(
                                firstnme,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                              Text(
                                middlenme,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                              Text(
                                lastnme,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("Dashboard"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    iconColor: Colors.black,
                    leading: Icon(
                      CupertinoIcons.person_crop_circle,
                      color: Colors.black,
                    ),
                    title: Text("Personal"),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Myprofile()));
                          },
                          child: ListTile(
                            title: Text("My Profile"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: ListTile(
                          title: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Diarypaige()));
                              },
                              child: Text("My Diary")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => staffpaige()));
                          },
                          child: ListTile(
                            title: Text("Staff Directory"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: GestureDetector(
                          onTap: () async {
                            await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(Duration(days: 2000)),
                                lastDate: DateTime(3000));
                          },
                          child: ListTile(
                            title: Text("Calender"),
                          ),
                        ),
                      ),
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: ExpansionTile(
                            iconColor: Colors.black,
                            title: Text(
                              "Leave Application",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LeaveApplication(selectpaige: 0)));
                                },
                                child: ListTile(
                                  title: Text("Assigned Leave"),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>LeaveApplication(selectpaige: 1),));
                                },
                                child: ListTile(
                                  title: Text("Leave Apply"),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    iconColor: Colors.black,
                    title: Text("Academic"),
                    leading: Icon(
                      Icons.school,
                      color: Colors.black,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Subjectpaige()));
                          },
                          child: ListTile(
                            title: Text("Subject"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TimeTablemainpaige()));
                          },
                          child: ListTile(
                            title: Text("Time Table"),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    iconColor: Colors.black,
                    title: Text("Library"),
                    leading: Icon(
                      Icons.library_books,
                      color: Colors.black,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: ListTile(title: Text("Request Books")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: ListTile(
                          title: Text("Issued Books"),
                        ),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    iconColor: Colors.black,
                    title: Text("Mock Test"),
                    leading: Icon(
                      Icons.book,
                      color: Colors.black,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: ListTile(title: Text("Test Scheduled")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: ListTile(
                          title: Text("Test Result"),
                        ),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    iconColor: Colors.black,
                    title: Text("Exam"),
                    leading: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: ListTile(
                          title: Text("Exam Scheduled"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: ListTile(
                          title: Text("Attend Exam"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: ListTile(
                          title: Text("Exam Result"),
                        ),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                leading: Icon(Icons.video_camera_front),
                title: Text("Online Class"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (cnt) => AlertDialog(
                            content: Container(
                              height: 100,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Do you want to Logout",
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "No",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.green)),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Loginpaige()));
                                        },
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.red)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ));
                },
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(children: [
        Stack(children: [
          Container(
            height: 450,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.elliptical(300, 90))),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(
                  height: 250,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(firstnme),
                            Text(middlenme),
                            Text(lastnme),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Reg.No:"),
                            Text(regno),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Container(
                                  height: 80,
                                  width: 120,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 40),
                                        child: Row(
                                          children: [
                                            Text("Class"),
                                            Text("-"),
                                            Text(cls)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30, top: 10),
                                        child: Row(
                                          children: [
                                            Text("Roll No"),
                                            Text("-"),
                                            Text(rollno)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              VerticalDivider(
                                color: Colors.black,
                                width: 40,
                                thickness: 0.0,
                                indent: 20,
                                endIndent: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Container(
                                  height: 80,
                                  width: 120,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Text("Division"),
                                          ),
                                          Text("-"),
                                          Text(division)
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10),
                                        child: Row(
                                          children: [
                                            Text("DOB"),
                                            Text("-"),
                                            Text(dob)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(studentimage),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 135),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(color: Colors.red, width: 2),
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 0.1)
                          ]),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(parentimage),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      parentfirstnme,
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        parentlastnme,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "parent",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Container(
            height: 550,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                // boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.0)]
                ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Color.fromARGB(255, 228, 228, 34),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Notice"),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              text1[index],
                            ),
                            subtitle: Text(text2[index],
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                            trailing: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Noticepaige(
                                                data1: text1[index],
                                                data2: text2[index],
                                              )));
                                },
                                icon: Icon(Icons.arrow_forward_ios)),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 0.0,
                            indent: 20,
                            endIndent: 20,
                            height: 20,
                            color: Colors.black,
                          );
                        },
                        itemCount: text1.length),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  void profilename() async {
    print("helloooooo");
    final result = await apiclass().profileuserapi();
    print("hello${result}");
    setState(() {
      firstnme = result!.data[0].firstName;
      middlenme = result.data[0].middleName;
      lastnme = result.data[0].lastName;
      regno = result.data[0].regNumber;
      cls = result.data[0].datumClass;
      dob = result.data[0].dob;
      rollno = result.data[0].rollNumber.toString();
      division = result.data[0].divisions.name;
      print("divison${division}");
      parentfirstnme = result.data[0].parents.firstName;
      parentlastnme = result.data[0].parents.lastName;
      print("parent${parentfirstnme}");
    });
  }
  void detailname()async{
    print("helloooooo");
    final result = await apiclass().detailuserapi();
    print("hello${result}");
    setState(() {
      studentimage = result!.data.profileImageUrl;
      parentimage = result.data.parents.imageUrl;
      
    });
  }
}