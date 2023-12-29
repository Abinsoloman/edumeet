import 'dart:io';
import 'package:dio/dio.dart';
import 'package:edumeetabin/api&url/apiclass.dart';
import 'package:edumeetabin/sharedpreferences/sharedpreferencesvaluepaige.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailname();
  }
  
  
  final firstname1= TextEditingController();
  final middlename1 = TextEditingController();
  final lastname1 = TextEditingController();

  File? profileimage;
  

  pickprofileimage() async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text("Choose from gallery"),
                  onTap: () {
                    getimage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text("Take a photo"),
                  onTap: () {
                    getimage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        });
  }

  getimage(ImageSource source) async {
    final picker = ImagePicker();
    final pickerfile = await picker.pickImage(source: source);

    if (pickerfile != null) {
      setState(() {
        profileimage = File(pickerfile.path);
      });
    }
  }
  String studentimage = "";
  String parentimage = "";

  String firstnme ="";
  String middlenme = "";
  String lastnme = "";
  String regno = "";
  String parentfirstnme = "";
  String parentlastnme = "";
  String gender = "";
  String cls = "";
  String division = "";
  String rollno = "";
  String dob = "";
  String phone = "";
  String email = "";
  String secondaryphone = "";
  String address = "";
  String place = "";
  String postcode = "";
  String bloodgroup = "";
  String state = "";
  String country = "";
  String nationality = "";


  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromRGBO(253, 253, 253, 25),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "My Profile",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.chat_outlined))
        ],
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.red),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(65),
                        border: Border.all(color: Colors.white, width: 4),
                        //boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.1)]
                        ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.amber,
                      //backgroundImage: NetworkImage(studentimage),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 80),
                  child: GestureDetector(
                    onTap: () {
                      pickprofileimage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          //boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.2)]
                          ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.photo),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Text(
                      "$firstnme $middlenme $lastnme",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ListView(children: [
                                Container(
                                  height: 290,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextField(
                                          controller: firstname1,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "First Name",
                                          ),
                                        ),
                                        TextField(
                                          controller: middlename1,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: "Middle Name"),
                                        ),
                                        TextField(
                                          controller: lastname1,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: "Last Name"),
                                        ),
                                        SizedBox(
                                          height: 50,
                                          width: 400,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                  profiletext();
                                              });
                                            
                                            },
                                            child: Text(
                                              "Save",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19),
                                            ),
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.red),
                                                shape: MaterialStatePropertyAll<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10)))),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ]);
                            });
                      },
                      icon: Icon(Icons.edit_square))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Reg.No : "), Text(regno)],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(65),
                      //boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.2)]
                      ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: () {
                            pickprofileimage();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                border:
                                    Border.all(color: Colors.red, width: 3)),
                            child: CircleAvatar(
                              radius: 30,
                             // backgroundImage: NetworkImage(parentimage),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 20),
                            child: Row(
                              children: [
                                Text(
                                  parentfirstnme,
                                  style: TextStyle(
                                      fontSize: 19, fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    parentlastnme,
                                    style: TextStyle(
                                        fontSize: 19, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Parent",
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        //boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.1)]
                        ),
                    child: Row(
                      children: [
                        Container(
                          height: 400,
                          width: 185,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Gender",
                                  style: TextStyle(fontSize: 19),
                                ),
                                Text("Class", style: TextStyle(fontSize: 19)),
                                Text("Division",
                                    style: TextStyle(fontSize: 19)),
                                Text("Roll No", style: TextStyle(fontSize: 19)),
                                Text("DOB", style: TextStyle(fontSize: 19)),
                                Text("Phone", style: TextStyle(fontSize: 19)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 400,
                          width: 185,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(gender, style: TextStyle(fontSize: 19)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(cls, style: TextStyle(fontSize: 19)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(division, style: TextStyle(fontSize: 19)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(rollno, style: TextStyle(fontSize: 19)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(dob,
                                        style: TextStyle(fontSize: 19)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(phone,
                                        style: TextStyle(fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                        ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, right: 20, left: 20, bottom: 20),
                child: Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        //boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.1)]
                        ),
                    child: Row(
                      children: [
                        Container(
                          height: 400,
                          width: 185,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Email", style: TextStyle(fontSize: 19)),
                                Text("Secondary Phone No",
                                    style: TextStyle(fontSize: 19,overflow: TextOverflow.ellipsis,
                                    )),
                                Text("Address", style: TextStyle(fontSize: 19)),
                                Text("place", style: TextStyle(fontSize: 19)),
                                Text("Post Code",
                                    style: TextStyle(fontSize: 19)),
                                Text("Blood Group",
                                    style: TextStyle(fontSize: 19)),
                                Text("State", style: TextStyle(fontSize: 19)),
                                Text("Country", style: TextStyle(fontSize: 19)),
                                Text("Nationality",
                                    style: TextStyle(fontSize: 19)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 400,
                          width: 185,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(email,
                                        style: TextStyle(fontSize:17)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(secondaryphone,
                                        style: TextStyle(fontSize: 19)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(address,
                                        overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                           style: TextStyle(fontSize: 19,
                                          ),
                                          ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(place,
                                        style: TextStyle(fontSize: 19)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(postcode, style: TextStyle(fontSize: 19)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(bloodgroup, style: TextStyle(fontSize: 19)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(state, style: TextStyle(fontSize: 19)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(country, style: TextStyle(fontSize: 19)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(":", style: TextStyle(fontSize: 19)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(nationality, style: TextStyle(fontSize: 19)),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
  
  void detailname()async{
    print("helloooooo");
    final result = await apiclass().detailuserapi();
    print("hello${result}");
    setState(() {
      firstnme = result!.data.firstName;
      middlenme = result.data.middleName;
      lastnme = result.data.lastName;
      regno = result.data.regNumber;
      parentfirstnme = result.data.parents.firstName;
      parentlastnme = result.data.parents.lastName;
      gender = result.data.gender;
      cls = result.data.classname.name;
      division = result.data.divisions.name;
      rollno = result.data.rollNumber.toString();
      dob = result.data.dob;
      phone = result.data.phone;
      
      email = result.data.email;
      secondaryphone = result.data.phone2;
      address = result.data.address;
      place = result.data.place;
      postcode = result.data.post;
      bloodgroup = result.data.blood;
      state = result.data.states.name;
      country = result.data.countries.name;
      nationality = result.data.nationalities.name;

      //studentimage = result.data.profileImageUrl;
      //parentimage = result.data.parents.imageUrl;
      
    });
  }
  void profiletext(){
    final firstname = firstname1.text;
    final middlename = middlename1.text;
    final lastname = lastname1.text;
    if(firstname.isEmpty){
      showerrormsg1("firstname is empty");
    }else if (middlename.isEmpty){
      showerrormsg1("middlename is empty");
    }else if(lastname.isEmpty){
      showerrormsg1("lastname is empty");
    }else{
      final frmdata2 = FormData.fromMap({
        "first_name":firstname,
        "middle_name": middlename,
        "last_name": lastname});
      final Response = apiclass().editprofileuserapi(frmdata2);
      if(Response != null){
        
        showsucessmsg1("edit sucess");
        
        next1();
      }else{
        showerrormsg1("edit fail");
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