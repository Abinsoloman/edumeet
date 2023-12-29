class leaveapplymodel
 {
  int? status;
  List<Data>? data;

  leaveapplymodel
  ({this.status, this.data});

  leaveapplymodel
  .fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? student;
  int? leaveCategory;
  String? applyDate;
  String? fromDate;
  String? toDate;
  int? leaveDays;
  String? reason;
  int? status;
  Null? attachment;
  Null? attachmentUrl;
  Studentname? studentname;
  LeaveCategoryname? leaveCategoryname;

  Data(
      {this.id,
      this.student,
      this.leaveCategory,
      this.applyDate,
      this.fromDate,
      this.toDate,
      this.leaveDays,
      this.reason,
      this.status,
      this.attachment,
      this.attachmentUrl,
      this.studentname,
      this.leaveCategoryname});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    student = json['student'];
    leaveCategory = json['leave_category'];
    applyDate = json['apply_date'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    leaveDays = json['leave_days'];
    reason = json['reason'];
    status = json['status'];
    attachment = json['attachment'];
    attachmentUrl = json['attachment_url'];
    studentname = json['studentname'] != null
        ? new Studentname.fromJson(json['studentname'])
        : null;
    leaveCategoryname = json['leave_categoryname'] != null
        ? new LeaveCategoryname.fromJson(json['leave_categoryname'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student'] = this.student;
    data['leave_category'] = this.leaveCategory;
    data['apply_date'] = this.applyDate;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['leave_days'] = this.leaveDays;
    data['reason'] = this.reason;
    data['status'] = this.status;
    data['attachment'] = this.attachment;
    data['attachment_url'] = this.attachmentUrl;
    if (this.studentname != null) {
      data['studentname'] = this.studentname!.toJson();
    }
    if (this.leaveCategoryname != null) {
      data['leave_categoryname'] = this.leaveCategoryname!.toJson();
    }
    return data;
  }
}

class Studentname {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;

  Studentname({this.id, this.firstName, this.middleName, this.lastName});

  Studentname.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    return data;
  }
}

class LeaveCategoryname {
  int? id;
  String? name;

  LeaveCategoryname({this.id, this.name});

  LeaveCategoryname.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}