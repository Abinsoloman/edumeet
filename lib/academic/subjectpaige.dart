import 'package:flutter/material.dart';

class Subjectpaige extends StatelessWidget {
  const Subjectpaige({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromRGBO(253, 253, 253, 25),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.chat_outlined))
          ],
          title: Text(
            "Subject",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          iconTheme: IconThemeData(color: Colors.white),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  itemExtent: 260,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("Class : "),
                                    Text("4 A"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Subject Code : "),
                                    Text("101")
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10),
                            child: Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    //boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.1)]
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          children: [
                                            Text("Subject Name"),
                                            Text(
                                              "Mathematics",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Text("Teacher")),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Anil VK, K Sarath ,Muhammed PK",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700),
                                              ))
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text("Subject Author : "),
                                              Text(
                                                "Pythagoras",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Pass Mark : "),
                                              Text(
                                                "15",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Final Mark : "),
                                              Text(
                                                "50",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Note : "),
                                              Flexible(
                                                child: Text(
                                                 "The First Terminal Examination 2075 from 2075/03/21, Thursday to 2075/03/29, Friday",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w700),
                                                      overflow: TextOverflow.ellipsis,
                                                
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          )
                        ],
                      );
                    }),
              ),
            )
          ],
        ));
  }
}