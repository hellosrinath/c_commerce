class ProfileModel {
  int? id;
  String? cusName;

  ProfileModel({this.id, this.cusName});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
  }
}