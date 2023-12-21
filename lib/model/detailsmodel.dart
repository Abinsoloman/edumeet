// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

detailsmodel
 temperaturesFromJson(String str) => detailsmodel
.fromJson(json.decode(str));

String temperaturesToJson(detailsmodel
 data) => json.encode(data.toJson());

class detailsmodel
 {
    int status;
    Data data;

    detailsmodel
    ({
        required this.status,
        required this.data,
    });

    factory detailsmodel
    .fromJson(Map<String, dynamic> json) => detailsmodel
    (
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String code;
    String firstName;
    String middleName;
    String lastName;
    String email;
    String phone;
    String phone2;
    String dob;
    String gender;
    String blood;
    String address;
    String house;
    String place;
    String post;
    int country;
    int state;
    String district;
    String taluk;
    String village;
    String idCard;
    String idNumber;
    String idFile;
    String nationality;
    String visaNumber;
    String visaIssued;
    String visaExpiry;
    String visaFile;
    String passportNumber;
    String passportFile;
    int department;
    String dataClass;
    int division;
    String regNumber;
    int rollNumber;
    String optSubject;
    String studentId;
    String transfer;
    String profileImage;
    int usertype;
    int active;
    String advance;
    int deposit;
    int createdUser;
    String createdUsertype;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    int academicYearId;
    int religion;
    int caste;
    String physical;
    String adhar;
    String birth;
    int parent;
    String token;
    String govSub;
    String username;
    String profileImageUrl;
    Parents parents;
    Castes classname;
    Castes divisions;
    Castes countries;
    Castes states;
    Castes nationalities;
    Castes religions;
    Castes castes;

    Data({
        required this.id,
        required this.code,
        required this.firstName,
        required this.middleName,
        required this.lastName,
        required this.email,
        required this.phone,
        required this.phone2,
        required this.dob,
        required this.gender,
        required this.blood,
        required this.address,
        required this.house,
        required this.place,
        required this.post,
        required this.country,
        required this.state,
        required this.district,
        required this.taluk,
        required this.village,
        required this.idCard,
        required this.idNumber,
        required this.idFile,
        required this.nationality,
        required this.visaNumber,
        required this.visaIssued,
        required this.visaExpiry,
        required this.visaFile,
        required this.passportNumber,
        required this.passportFile,
        required this.department,
        required this.dataClass,
        required this.division,
        required this.regNumber,
        required this.rollNumber,
        required this.optSubject,
        required this.studentId,
        required this.transfer,
        required this.profileImage,
        required this.usertype,
        required this.active,
        required this.advance,
        required this.deposit,
        required this.createdUser,
        required this.createdUsertype,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.academicYearId,
        required this.religion,
        required this.caste,
        required this.physical,
        required this.adhar,
        required this.birth,
        required this.parent,
        required this.token,
        required this.govSub,
        required this.username,
        required this.profileImageUrl,
        required this.parents,
        required this.classname,
        required this.divisions,
        required this.countries,
        required this.states,
        required this.nationalities,
        required this.religions,
        required this.castes,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        code: json["code"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        phone2: json["phone2"],
        dob: json["dob"],
        gender: json["gender"],
        blood: json["blood"],
        address: json["address"],
        house: json["house"],
        place: json["place"],
        post: json["post"],
        country: json["country"],
        state: json["state"],
        district: json["district"],
        taluk: json["taluk"],
        village: json["village"],
        idCard: json["id_card"],
        idNumber: json["id_number"],
        idFile: json["id_file"],
        nationality: json["nationality"],
        visaNumber: json["visa_number"],
        visaIssued: json["visa_issued"],
        visaExpiry: json["visa_expiry"],
        visaFile: json["visa_file"],
        passportNumber: json["passport_number"],
        passportFile: json["passport_file"],
        department: json["department"],
        dataClass: json["class"],
        division: json["division"],
        regNumber: json["reg_number"],
        rollNumber: json["roll_number"],
        optSubject: json["opt_subject"],
        studentId: json["student_id"],
        transfer: json["transfer"],
        profileImage: json["profile_image"],
        usertype: json["usertype"],
        active: json["active"],
        advance: json["advance"],
        deposit: json["deposit"],
        createdUser: json["created_user"],
        createdUsertype: json["created_usertype"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        academicYearId: json["academic_year_id"],
        religion: json["religion"],
        caste: json["caste"],
        physical: json["physical"],
        adhar: json["adhar"],
        birth: json["birth"],
        parent: json["parent"],
        token: json["token"],
        govSub: json["gov_sub"],
        username: json["username"],
        profileImageUrl: json["profile_image_url"],
        parents: Parents.fromJson(json["parents"]),
        classname: Castes.fromJson(json["classname"]),
        divisions: Castes.fromJson(json["divisions"]),
        countries: Castes.fromJson(json["countries"]),
        states: Castes.fromJson(json["states"]),
        nationalities: Castes.fromJson(json["nationalities"]),
        religions: Castes.fromJson(json["religions"]),
        castes: Castes.fromJson(json["castes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "phone2": phone2,
        "dob": dob,
        "gender": gender,
        "blood": blood,
        "address": address,
        "house": house,
        "place": place,
        "post": post,
        "country": country,
        "state": state,
        "district": district,
        "taluk": taluk,
        "village": village,
        "id_card": idCard,
        "id_number": idNumber,
        "id_file": idFile,
        "nationality": nationality,
        "visa_number": visaNumber,
        "visa_issued": visaIssued,
        "visa_expiry": visaExpiry,
        "visa_file": visaFile,
        "passport_number": passportNumber,
        "passport_file": passportFile,
        "department": department,
        "class": dataClass,
        "division": division,
        "reg_number": regNumber,
        "roll_number": rollNumber,
        "opt_subject": optSubject,
        "student_id": studentId,
        "transfer": transfer,
        "profile_image": profileImage,
        "usertype": usertype,
        "active": active,
        "advance": advance,
        "deposit": deposit,
        "created_user": createdUser,
        "created_usertype": createdUsertype,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "academic_year_id": academicYearId,
        "religion": religion,
        "caste": caste,
        "physical": physical,
        "adhar": adhar,
        "birth": birth,
        "parent": parent,
        "token": token,
        "gov_sub": govSub,
        "username": username,
        "profile_image_url": profileImageUrl,
        "parents": parents.toJson(),
        "classname": classname.toJson(),
        "divisions": divisions.toJson(),
        "countries": countries.toJson(),
        "states": states.toJson(),
        "nationalities": nationalities.toJson(),
        "religions": religions.toJson(),
        "castes": castes.toJson(),
    };
}

class Castes {
    int id;
    String name;

    Castes({
        required this.id,
        required this.name,
    });

    factory Castes.fromJson(Map<String, dynamic> json) => Castes(
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
    String code;
    String imageUrl;
    String photo;

    Parents({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.code,
        required this.imageUrl,
        required this.photo,
    });

    factory Parents.fromJson(Map<String, dynamic> json) => Parents(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        code: json["code"],
        imageUrl: json["image_url"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "code": code,
        "image_url": imageUrl,
        "photo": photo,
    };
}
