class diaryeditmodel
 {
  int? status;
  Data? data;

  diaryeditmodel
  ({this.status, this.data});

  diaryeditmodel
  .fromJson(Map<String, dynamic> json) {
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
  String? note;
  String? date;

  Data({this.id, this.note, this.date});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['note'] = this.note;
    data['date'] = this.date;
    return data;
  }
}