class CreateProfileModel {
  final String cusName;
  String? cusAdd;
  final String cusCity;
  String? cusState;
  String? cusPostcode;
  String? cusCountry;
  final String cusPhone;
  String? cusFax;
  String? shipName;
  final String shipAdd;
  String? shipCity;
  String? shipState;
  String? shipPostcode;
  String? shipCountry;
  String? shipPhone;

  CreateProfileModel({
    required this.cusName,
    required this.cusCity,
    required this.cusPhone,
    required this.shipAdd,
    this.cusAdd,
    this.cusState,
    this.cusPostcode,
    this.cusCountry,
    this.cusFax,
    this.shipName,
    this.shipCity,
    this.shipState,
    this.shipPostcode,
    this.shipCountry,
    this.shipPhone,
  });

/*  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cus_name'] = cusName;
    data['cus_add'] = cusAdd;
    data['cus_city'] = cusCity;
    data['cus_state'] = cusState;
    data['cus_postcode'] = cusPostcode;
    data['cus_country'] = cusCountry;
    data['cus_phone'] = cusPhone;
    data['cus_fax'] = cusFax;
    data['ship_name'] = shipName;
    data['ship_add'] = shipAdd;
    data['ship_city'] = shipCity;
    data['ship_state'] = shipState;
    data['ship_postcode'] = shipPostcode;
    data['ship_country'] = shipCountry;
    data['ship_phone'] = shipPhone;
    return data;
  }*/

  Map<String, dynamic> toJson() {
    return {
      "cus_name": cusName,
      "cus_add": cusAdd,
      "cus_city": cusCity,
      "cus_state": cusState,
      "cus_postcode": cusPostcode,
      "cus_country": cusCountry,
      "cus_phone": cusPhone,
      "cus_fax": cusFax,
      "ship_name": shipName,
      "ship_add": shipAdd,
      "ship_city": shipCity,
      "ship_state": shipState,
      "ship_postcode": shipPostcode,
      "ship_country": shipCountry
    };
  }
}
