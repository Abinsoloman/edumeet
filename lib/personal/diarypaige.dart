import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Diarypaige extends StatefulWidget {
  const Diarypaige({super.key});

  @override
  State<Diarypaige> createState() => _DiarypaigeState();
}

class _DiarypaigeState extends State<Diarypaige> {
  var date = "";
  final enterdate = TextEditingController();
  final enternote = TextEditingController();

  @override
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
                                        controller: enterdate,
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
                                                    enterdate.text = date;
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
                                            controller: enternote,
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
                                          onPressed: () {},
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
                              ));
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
                  itemCount: 2,
                  itemBuilder: (context, index) {
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
                                  child: Center(child: Text("16",
                                  style: TextStyle(color: Colors.white),)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                    "Good Day",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 45, top: 10),
                              child: Row(
                                children: [Text("Date : "), Text("12/12/2023")],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 45, top: 20),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
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
}