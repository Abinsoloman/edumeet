class leavesavemodel {
  int? status;
  Data? data;

  leavesavemodel({this.status, this.data});

  leavesavemodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? fromTime;
  String? toTime;
  int? leaveDays;
  String? reason;
  int? status;
  Null? attachment;
  Null? attachmentUrl;

  Data(
      {this.id,
      this.student,
      this.leaveCategory,
      this.applyDate,
      this.fromDate,
      this.toDate,
      this.fromTime,
      this.toTime,
      this.leaveDays,
      this.reason,
      this.status,
      this.attachment,
      this.attachmentUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    student = json['student'];
    leaveCategory = json['leave_category'];
    applyDate = json['apply_date'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    leaveDays = json['leave_days'];
    reason = json['reason'];
    status = json['status'];
    attachment = json['attachment'];
    attachmentUrl = json['attachment_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student'] = this.student;
    data['leave_category'] = this.leaveCategory;
    data['apply_date'] = this.applyDate;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['leave_days'] = this.leaveDays;
    data['reason'] = this.reason;
    data['status'] = this.status;
    data['attachment'] = this.attachment;
    data['attachment_url'] = this.attachmentUrl;
    return data;
  }
}