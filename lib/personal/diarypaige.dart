
import 'package:dio/dio.dart';
import 'package:edumeetabin/api&url/apiclass.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';

class Diarypaige extends StatefulWidget {
  const Diarypaige({super.key});

  @override
  State<Diarypaige> createState() => _DiarypaigeState();
}

class _DiarypaigeState extends State<Diarypaige> {
  var date = "";
  final enterdate1 = TextEditingController();
  final enternote2 = TextEditingController();
  var id3 = "";
  
  //String diaryapiurl = "http://iroidtechnologies.in/jeetmeet/api/student/diaries";
  var diariespost = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    diarypost();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 253, 253, 25),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.red,
          title: Text(
            "Diary",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.chat_outlined))
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                          //boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.0)]
                          ),
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
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, top: 20),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (cnt) => AlertDialog(
                                content: Container(
                                  height: 400,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Add Diares"),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.close))
                                        ],
                                      ),
                                      TextField(
                                        controller: enterdate1,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "Enter Date",
                                            suffixIcon: IconButton(
                                                onPressed: () async {
                                                  final selectedate1 =
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
                                                    date =
                                                        DateFormat.yMMMMEEEEd()
                                                            .format(
                                                                selectedate1!);
                                                    enterdate1.text = date;
                                                  });
                                                },
                                                icon: Icon(Icons.date_range))),
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
                                            controller: enternote2,
                                            keyboardType:
                                                TextInputType.multiline,
                                            expands: true,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              labelText: "Enter Note",
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              diariesave();
                                            });
                                          },
                                          child: Text(
                                            "Submit",
                                            style:
                                                TextStyle(color: Colors.white),
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
                              )
                              );
                    },
                    child: Text(
                      "Add Diaries+",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                )),
            Expanded(
              child: ListView.builder(
                  itemCount: diariespost.length,
                  itemBuilder: (context, index) {
                    id3 = index.toString();
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            //boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.1)],
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(5))),
                                  child: Center(child: Text(diariespost[index].id.toString(),
                                  style: TextStyle(color: Colors.white),)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                    diariespost[index].note.toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 45, top: 10),
                              child: Row(
                                children: [Text("Date : "), Text(diariespost[index].date.toString())],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 45, top: 20),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                          context: context,
                          builder: (cnt) => AlertDialog(
                                content: Container(
                                  height: 400,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Add Diares"),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.close))
                                        ],
                                      ),
                                      TextField(
                                        controller: enterdate1,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "Enter Date",
                                            suffixIcon: IconButton(
                                                onPressed: () async {
                                                  final selectedate1 =
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
                                                    date =
                                                        DateFormat.yMMMMEEEEd()
                                                            .format(
                                                                selectedate1!);
                                                    enterdate1.text = date;
                                                  });
                                                },
                                                icon: Icon(Icons.date_range))),
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
                                            controller: enternote2,
                                            keyboardType:
                                                TextInputType.multiline,
                                            expands: true,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              labelText: "Enter Note",
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                             //diariesave(); 
                                             diaryedit();
                                            });
                                          },
                                          child: Text(
                                            "Submit",
                                            style:
                                                TextStyle(color: Colors.white),
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
                              )
                              );
                                    },
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                      shape: MaterialStatePropertyAll<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.orange),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                          shape: MaterialStatePropertyAll<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
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
                      ),
                    );
                  }),
            )
          ],
        ));
  }
  void diarypost()async{
    final result = await apiclass().diaryuserapi();
    setState(() {
      diariespost.addAll(result!.data!);
      print(diariespost);
    });
  }
  void diaryedit(){
    final enterdate = enterdate1.text;
    final enternote = enternote2.text;
    if(enterdate.isEmpty){
      showerrormsg1("Date is Empty");
    }else if (enternote.isEmpty){
      showerrormsg1("Note is Empty");
    }else{
    final frmdata4 = FormData.fromMap({
        "id":id3,
      });
      final Response = apiclass().diaryedituserapi(frmdata4);
      print("response${Response}");
      if(Response != null){
      showsucessmsg1("Edit Sucess");
      next1();
    }
    }
  }
  void diariesave(){
    final enterdate = enterdate1.text;
    final enternote = enternote2.text;
    if(enterdate.isEmpty){
      showerrormsg1("Enter Date");
    }else if(enternote.isEmpty){
      showerrormsg1("Note is Empty");
    }else{
      final frmdata3 = FormData.fromMap({
        "id":id3,
        "date":enterdate,
        "note":enternote
      });
      final Response = apiclass().diariessaveapi(frmdata3);
      if(Response != null){
        showsucessmsg1("Diary is created");
        next1();
      }else{
        showerrormsg1("Fail");
      }
    }
  }
  void showsucessmsg1(String msg) {
    MotionToast.success(
            description: Text(msg), position: MotionToastPosition.top,
            )
        .show(context);
  }

  void showerrormsg1(String msg) {
    MotionToast.error(description: Text(msg), position: MotionToastPosition.top)
        .show(context);
  }
  next1(){
    return Future.delayed(Duration(seconds: 4),(){
      Navigator.pop(context);
    });
  }
}