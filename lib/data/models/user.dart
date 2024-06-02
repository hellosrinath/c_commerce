class User {
  int? id;
  String? email;
  String? otp;
  String? createdAt;
  String? updatedAt;

  User({this.id, this.email, this.otp, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    otp = json['otp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
