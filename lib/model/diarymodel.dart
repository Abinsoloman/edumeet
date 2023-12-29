class diarymodel {
  int? status;
  List<Data>? data;

  diarymodel({this.status, this.data});

  diarymodel.fromJson(Map<String, dynamic> json) {
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