import 'package:c_commerce/data/models/user_data.dart';

class UserDataModel {
  String? msg;
  UserData? data;

  UserDataModel({this.msg, this.data});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}



