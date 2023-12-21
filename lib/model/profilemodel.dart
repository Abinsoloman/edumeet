// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);

import 'dart:convert';

profilemodel emptyFromJson(String str) => profilemodel.fromJson(json.decode(str));

String emptyToJson(profilemodel data) => json.encode(data.toJson());

class profilemodel {
    int status;
    List<Datum> data;

    profilemodel({
        required this.status,
        required this.data,
    });

    factory profilemodel.fromJson(Map<String, dynamic> json) => profilemodel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String firstName;
    String middleName;
    String lastName;
    String regNumber;
    int rollNumber;
    String dob;
    int parent;
    String datumClass;
    int division;
    Parents parents;
    Classname classname;
    Classname divisions;

    Datum({
        required this.id,
        required this.firstName,
        required this.middleName,
        required this.lastName,
        required this.regNumber,
        required this.rollNumber,
        required this.dob,
        required this.parent,
        required this.datumClass,
        required this.division,
        required this.parents,
        required this.classname,
        required this.divisions,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        regNumber: json["reg_number"],
        rollNumber: json["roll_number"],
        dob: json["dob"],
        parent: json["parent"],
        datumClass: json["class"],
        division: json["division"],
        parents: Parents.fromJson(json["parents"]),
        classname: Classname.fromJson(json["classname"]),
        divisions: Classname.fromJson(json["divisions"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "reg_number": regNumber,
        "roll_number": rollNumber,
        "dob": dob,
        "parent": parent,
        "class": datumClass,
        "division": division,
        "parents": parents.toJson(),
        "classname": classname.toJson(),
        "divisions": divisions.toJson(),
    };
}

class Classname {
    int id;
    String name;

    Classname({
        required this.id,
        required this.name,
    });

    factory Classname.fromJson(Map<String, dynamic> json) => Classname(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Parents {
    int id;
    String firstName;
    String lastName;

    Parents({
        required this.id,
        required this.firstName,
        required this.lastName,
    });

    factory Parents.fromJson(Map<String, dynamic> json) => Parents(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
    };
}
