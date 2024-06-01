import 'package:c_commerce/data/models/slider_data.dart';

class SliderListModel {
  String? msg;
  List<SliderData>? sliderDataList;

  SliderListModel({this.msg, this.sliderDataList});

  SliderListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderDataList = <SliderData>[];
      json['data'].forEach((v) {
        sliderDataList!.add(SliderData.fromJson(v));
      });
    }
  }
}

