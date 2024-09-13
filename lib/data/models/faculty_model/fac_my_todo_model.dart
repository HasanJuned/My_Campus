class FacMyTodoModel {
  String? status;
  int? count;
  List<Data>? data;

  FacMyTodoModel({this.status, this.count, this.data});

  FacMyTodoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      (json['data'] as Map).forEach((v) {
        data!.add(Data.fromJson(v));
      } as void Function(dynamic key, dynamic value));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  String? date;
  String? createdDate;

  Data({this.sId, this.title, this.date, this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    date = json['date'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['date'] = date;
    data['createdDate'] = createdDate;
    return data;
  }
}
