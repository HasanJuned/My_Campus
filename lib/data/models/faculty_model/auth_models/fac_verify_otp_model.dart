class FacVerifyOTPModel {
  String? status;
  String? data;

  FacVerifyOTPModel({this.status, this.data});

  FacVerifyOTPModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data;
    return data;
  }
}
