import 'package:c_commerce/data/models/review_item_model.dart';

class ReviewListModel {
  String? msg;
  List<ReviewItemModel>? reviewList;

  ReviewListModel({this.msg, this.reviewList});

  ReviewListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      reviewList = <ReviewItemModel>[];
      json['data'].forEach((v) {
        reviewList!.add(ReviewItemModel.fromJson(v));
      });
    }
  }

}




