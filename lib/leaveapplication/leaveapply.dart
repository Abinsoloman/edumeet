import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class LeaveApply extends StatefulWidget {
  LeaveApply({super.key});

  @override
  State<LeaveApply> createState() => _LeaveApplyState();
}

class _LeaveApplyState extends State<LeaveApply> {
  final List<String> leavecategory = [
    "Annul",
    "Casual",
    "Sick",
    "Family Emergency"
  ];
  String slectedcategory = "";

  var startingdate = "";
  final startingdatecontroller = TextEditingController();
  var endingdate = "";
  final endingdatecontroller = TextEditingController();

  var startingtime = TimeOfDay.now();
  final startingtimecontroller = TextEditingController();
  var endingtime = TimeOfDay.now();
  final endingtimecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                itemCount: 2,
                itemBuilder: (context, index) {
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
                                child: Text("12/12/2023"),
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
                                    decoration:
                                        BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Center(
                                        child: Text(
                                      "Pending",
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
                                              Text("Kiran R V"),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: Column(
                                                  children: [
                                                    Text("Shedule"),
                                                    Text("Date")
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
                                              Text("Casual"),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: Column(
                                                  children: [
                                                    Text("Days"),
                                                    Text("1")
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
                                      Text("Reason for leave"),
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
                                              onPressed: () {},
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
                                                  BorderRadius.circular(5))),
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
                                                  BorderRadius.circular(5))),
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
                                            slectedcategory = value.toString();
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
                                                        DateFormat.yMMMMEEEEd()
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
                                            labelText: "Starting Time",
                                            suffixIcon: IconButton(
                                                onPressed: () async {
                                                  final selecttime1 =
                                                      await showTimePicker(
                                                          context: context,
                                                          initialTime:
                                                              TimeOfDay.now());
                                                  if (selecttime1 != null &&
                                                      selecttime1 !=
                                                          startingtime) {
                                                    setState(() {
                                                      startingtimecontroller
                                                              .text =
                                                          selecttime1
                                                              .toString();
                                                    });
                                                  }
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
                                                        DateFormat.yMMMMEEEEd()
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
                                                              .text =
                                                          selecttime2
                                                              .toString();
                                                    });
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
                                        onPressed: () {},
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
}