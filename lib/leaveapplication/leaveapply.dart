import 'package:dio/dio.dart';
import 'package:edumeetabin/api&url/apiclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';

class LeaveApply extends StatefulWidget {
  LeaveApply({super.key});

  @override
  State<LeaveApply> createState() => _LeaveApplyState();
}

class _LeaveApplyState extends State<LeaveApply> {
  var leavecategory = ["Annul", "Casual", "Onam"];

  var leaveapplydata = [];
  var id4 = "";

  String slectedcategory = "";

  var startingdate = "";
  final startingdatecontroller = TextEditingController();
  var endingdate = "";
  final endingdatecontroller = TextEditingController();

  TimeOfDay startingtime = TimeOfDay.now();
  final startingtimecontroller = TextEditingController();
  var endingtime = TimeOfDay.now();
  final endingtimecontroller = TextEditingController();
  final reasoncontroller = TextEditingController();

  var clr = Colors.orange;
  var sta = "Pending";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      leaveapply();
    });
   
  }
  

  Widget build(BuildContext context) {

    String formattedTime = startingtime.format(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 253, 253, 25),
      body: Column(
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Container(
                    height: 40,
                    width: 270,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      //boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.0)]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Copy"),
                        VerticalDivider(
                          color: Colors.black,
                          width: 0.1,
                          thickness: 0.0,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Text("Excel"),
                        VerticalDivider(
                          color: Colors.black,
                          width: 0.1,
                          thickness: 0.0,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Text("CSV"),
                        VerticalDivider(
                          color: Colors.black,
                          width: 0.1,
                          thickness: 0.0,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Text("PDF")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 0.0)
                        ]),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.filter_alt)),
                        Text("Filter")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: leaveapplydata.length,
                itemBuilder: (context, index) {
                  id4 = index.toString();
                  if (leaveapplydata[index].status == 0) {
                    clr = Colors.orange;
                    sta = "Pending";
                  } else if (leaveapplydata[index].status == 1) {
                    clr = Colors.green;
                    sta = "Approved";
                  } else if (leaveapplydata[index].status == 2) {
                    clr = Colors.red;
                    sta = "Rejected";
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 20, left: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Date:"),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                    leaveapplydata[index].applyDate.toString()),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Text("Status:"),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 65,
                                    decoration: BoxDecoration(
                                        color: clr,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Center(
                                        child: Text(
                                      sta,
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              //boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.1)],
                              borderRadius: BorderRadius.circular(20)),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 170,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30, left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Applicant Name"),
                                              Row(
                                                children: [
                                                  Text(leaveapplydata[index]
                                                      .studentname
                                                      .firstName
                                                      .toString()),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Text(
                                                        leaveapplydata[index]
                                                            .studentname
                                                            .middleName
                                                            .toString()),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Text(
                                                        leaveapplydata[index]
                                                            .studentname
                                                            .lastName
                                                            .toString()),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Shedule"),
                                                    Row(
                                                      children: [
                                                        Text("From :"),
                                                        Text(leaveapplydata[
                                                                index]
                                                            .fromDate
                                                            .toString()),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("To :"),
                                                        Text(leaveapplydata[
                                                                index]
                                                            .toDate
                                                            .toString())
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      VerticalDivider(
                                        color: Colors.black,
                                        width: 5,
                                        thickness: 0.0,
                                        indent: 15,
                                        endIndent: 15,
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 200,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30, right: 40),
                                          child: Column(
                                            children: [
                                              Text("Category"),
                                              Text(leaveapplydata[index]
                                                  .leaveCategoryname
                                                  .name
                                                  .toString()),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: Column(
                                                  children: [
                                                    Text("Days"),
                                                    Text(leaveapplydata[index]
                                                        .leaveDays
                                                        .toString())
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Reason"),
                                      Text(leaveapplydata[index]
                                          .reason
                                          .toString()),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text("Attachment"),
                                      ),
                                      Container(
                                        height: 35,
                                        width: 85,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Divider(
                                          thickness: 0.0,
                                          color: Colors.black,
                                          indent: 10,
                                          endIndent: 20,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (cnt1) => AlertDialog(
                                                              content:
                                                                  Container(
                                                                height: double
                                                                    .infinity,
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            "Leave Application",
                                                                            style:
                                                                                TextStyle(fontSize: 19),
                                                                          ),
                                                                          IconButton(
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              icon: Icon(Icons.close))
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child: DropdownButtonFormField(
                                                                            decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Select category")),
                                                                            items: leavecategory
                                                                                .map((e) => DropdownMenuItem(
                                                                                      child: Text(e),
                                                                                      value: e,
                                                                                    ))
                                                                                .toList(),
                                                                            onChanged: ((value) {
                                                                              slectedcategory = value.toString();
                                                                            })),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              startingdatecontroller,
                                                                          decoration: InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: "Starting Date",
                                                                              suffixIcon: IconButton(
                                                                                  onPressed: () async {
                                                                                    final selectedate2 = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now().subtract(Duration(days: 2000)), lastDate: DateTime(3000));
                                                                                    setState(() {
                                                                                      startingdate = DateFormat.yMMMMEEEEd().format(selectedate2!);
                                                                                      startingdatecontroller.text = startingdate;
                                                                                    });
                                                                                  },
                                                                                  icon: Icon(Icons.date_range))),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              startingtimecontroller,
                                                                          decoration: InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: "Starting Time",
                                                                              suffixIcon: IconButton(
                                                                                  onPressed: () async {
                                                                                    final selecttime1 = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                                                                                    if (selecttime1 != null && selecttime1 != startingtime) {
                                                                                      setState(() {
                                                                                        startingtimecontroller.text = selecttime1.toString();
                                                                                      });
                                                                                    }
                                                                                  },
                                                                                  icon: Icon(Icons.schedule))),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              endingdatecontroller,
                                                                          decoration: InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: "End Date",
                                                                              suffixIcon: IconButton(
                                                                                  onPressed: () async {
                                                                                    final selectedate3 = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now().subtract(Duration(days: 2000)), lastDate: DateTime(3000));
                                                                                    setState(() {
                                                                                      endingdate = DateFormat.yMMMMEEEEd().format(selectedate3!);
                                                                                      endingdatecontroller.text = endingdate;
                                                                                    });
                                                                                  },
                                                                                  icon: Icon(Icons.date_range))),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              endingtimecontroller,
                                                                          decoration: InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: "End Time",
                                                                              suffixIcon: IconButton(
                                                                                  onPressed: () async {
                                                                                    final selecttime2 = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                                                                                    if (selecttime2 != null && selecttime2 != endingtime) {
                                                                                      setState(() {
                                                                                        endingtimecontroller.text = selecttime2.toString();
                                                                                      });
                                                                                    }
                                                                                  },
                                                                                  icon: Icon(Icons.schedule))),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              200,
                                                                          width:
                                                                              300,
                                                                          decoration:
                                                                              BoxDecoration(border: Border.all(color: Colors.black)),
                                                                          child:
                                                                              TextField(
                                                                            controller:
                                                                                reasoncontroller,
                                                                            keyboardType:
                                                                                TextInputType.multiline,
                                                                            enabled:
                                                                                true,
                                                                            maxLines:
                                                                                null,
                                                                            decoration:
                                                                                InputDecoration(labelText: "Reason", border: InputBorder.none),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            TextField(
                                                                          decoration: InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: "Attachment",
                                                                              suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.attach_file))),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            ElevatedButton(
                                                                          onPressed:
                                                                              () {

                                                                              },
                                                                          child:
                                                                              Text(
                                                                            "Submit",
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          ),
                                                                          style:
                                                                              ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ));
                                              },
                                              child: Text(
                                                "Edit",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              style: ButtonStyle(
                                                  shape: MaterialStatePropertyAll<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5))),
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.orange)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                style: ButtonStyle(
                                                    shape: MaterialStatePropertyAll<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5))),
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.red)),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 70,
            width: 350,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (cnt1) => AlertDialog(
                            content: Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Leave Application",
                                          style: TextStyle(fontSize: 19),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(Icons.close))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              label: Text("Select category")),
                                          items: leavecategory
                                              .map((e) => DropdownMenuItem(
                                                    child: Text(e),
                                                    value: e,
                                                  ))
                                              .toList(),
                                          onChanged: ((value) {
                                            setState(() {
                                              slectedcategory =
                                                  value.toString();
                                              //leaveadd();
                                            });
                                            //value.toString();
                                            //slectedcategory = value.toString();
                                            //leaveadd();
                                          })),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: TextField(
                                        controller: startingdatecontroller,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "Starting Date",
                                            suffixIcon: IconButton(
                                                onPressed: () async {
                                                  final selectedate2 =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate: DateTime
                                                                  .now()
                                                              .subtract(Duration(
                                                                  days: 2000)),
                                                          lastDate:
                                                              DateTime(3000));
                                                  setState(() {
                                                    startingdate =
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(
                                                                selectedate2!);
                                                    startingdatecontroller
                                                        .text = startingdate;
                                                  });
                                                },
                                                icon: Icon(Icons.date_range))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: TextField(
                                        controller: startingtimecontroller,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "Starting Time:$formattedTime",
                                            suffixIcon: IconButton(
                                                onPressed: () 
                                                async { selectTime(context);
                                                  // final selecttime1 =
                                                  //     await showTimePicker(
                                                  //         context: context,
                                                  //         initialTime:
                                                  //             TimeOfDay.now());
                                                  // if (selecttime1 != null &&
                                                  //     selecttime1 !=
                                                  //         startingtime) {
                                                  //   setState(() {
                                                  //     startingtimecontroller
                                                  //             .text =
                                                  //         selecttime1
                                                  //             .toString();
                                                  //   });
                                                  // }
                                                },
                                                icon: Icon(Icons.schedule))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: TextField(
                                        controller: endingdatecontroller,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "End Date",
                                            suffixIcon: IconButton(
                                                onPressed: () async {
                                                  final selectedate3 =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate: DateTime
                                                                  .now()
                                                              .subtract(Duration(
                                                                  days: 2000)),
                                                          lastDate:
                                                              DateTime(3000));
                                                  setState(() {
                                                    endingdate =
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(
                                                                selectedate3!);
                                                    endingdatecontroller.text =
                                                        endingdate;
                                                  });
                                                },
                                                icon: Icon(Icons.date_range))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: TextField(
                                        controller: endingtimecontroller,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "End Time",
                                            suffixIcon: IconButton(
                                                onPressed: () async {
                                                  final selecttime2 =
                                                      await showTimePicker(
                                                          context: context,
                                                          initialTime:
                                                              TimeOfDay.now());
                                                  if (selecttime2 != null &&
                                                      selecttime2 !=
                                                          endingtime) {
                                                    setState(() {
                                                      endingtimecontroller
                                                              .text = DateFormat.jm().format(DateTime.now());
                                                          // selecttime2
                                                              // .toString();
                                                    }
                                                    );
                                                  }
                                                },
                                                icon: Icon(Icons.schedule))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        height: 200,
                                        width: 300,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: TextField(
                                          controller: reasoncontroller,
                                          keyboardType: TextInputType.multiline,
                                          enabled: true,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                              labelText: "Reason",
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "Attachment",
                                            suffixIcon: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.attach_file))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                         leavesave();
                                        },
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.grey)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                },
                child: Text(
                  "Add a leave application",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // void leaveadd()async{
  //   final result = await apiclass().levaeadduserapi();
  //   setState(() {
  //     leavecategory.addAll(result!.data!);
  //     print(leavecategory);
  //   });
  // }
  void leaveapply() async {
    final result = await apiclass().leaveapplyuserapi();
    setState(() {
      leaveapplydata.addAll(result!.data!);
      print(leaveapplydata);
    });
  }

  void leavesave() async {
    final leavecategory = 1;
    final startingdatecontroller1 = startingdatecontroller.text;
    final endingdatecontroller1 = endingdatecontroller.text;
    final startingtimecontroller1 = startingtimecontroller.text;
    final endingtimecontroller1 = endingtimecontroller.text;
    final reasoncontroller1 = reasoncontroller.text;
    if (startingdatecontroller1.isEmpty) {
      showerrormsg1("Starting Date is Empty");
    } else if (endingdatecontroller1.isEmpty) {
      showerrormsg1("Ending Date is Empty");
    } else if (startingtimecontroller1.isEmpty) {
      showerrormsg1("Starting Time is Empty");
    } else if (endingtimecontroller1.isEmpty) {
      showerrormsg1("Ending Time is Empty");
    } else if (reasoncontroller1.isEmpty) {
      showerrormsg1("Enter your Reason");
    } else {
      final frmdata4 = FormData.fromMap({
        "start_date": startingdatecontroller1,
        "end_date": endingdatecontroller1,
        "start_time": startingtimecontroller1,
        "end_time": endingtimecontroller1,
        "leave_category": "2",
        "reason": reasoncontroller1,
        "attachment":""
      });
      print("formdata*********${startingdatecontroller1}  ${endingdatecontroller1} ${startingtimecontroller1} ${endingtimecontroller1} ${reasoncontroller1}");
      final Response = await apiclass().leavesaveuserapi(frmdata4);
      if (Response != null) {
        if (Response.status == 1) {
          showsucessmsg1("applied");
        //  next1();
        }
      } else {
        showerrormsg1("Failed");
      }
    }
  }

  void showsucessmsg1(String msg) {
    MotionToast.success(
      description: Text(msg),
      position: MotionToastPosition.top,
    ).show(context);
  }

  void showerrormsg1(String msg) {
    MotionToast.error(description: Text(msg), position: MotionToastPosition.top)
        .show(context);
  }

  next1() {
    return Future.delayed(Duration(seconds: 4), () {
      Navigator.pop(context);
    });
  }
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:startingtime
    );

    if (picked != null && picked != startingtime) {
      setState(() {
        startingtime = picked;
      });
    }
  }
}
