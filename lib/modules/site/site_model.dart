import 'package:thingsboard_pe_client/thingsboard_client.dart';

class Site extends Asset{
  String? site_address;
  String? const_period;
  String? weather;
  double? site_temperature;
  num?    img_src;

  Site.fromJson(Map<String, dynamic> json)
      : site_address = json['site_address'],
        const_period = json['const_period'],
        weather = json['weather'],
        site_temperature =json['site_temperature'],
        img_src = json['img_src'],
        super.fromJson(json);

  Site.cloneFromAsset(Asset asset) :
        this.fromJson(asset.toJson());
}