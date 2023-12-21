import 'package:flutter/material.dart';

class Assignedleavepaige extends StatelessWidget {
  const Assignedleavepaige({super.key});

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
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 0.0)
                      ]),
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
                      Text("PDF"),
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
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Card(
                      color: Colors.white,
                      elevation: 10,
                      child: Center(
                        child: ListTile(
                          title: Text("Annual"),
                          trailing: Text("15 Days"),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    ));
  }
}