import 'package:thingsboard_pe_client/thingsboard_client.dart';

class Set extends Asset{
  String? location;
  double? avgTemperature;
  String? fromSite;
  Set.fromJson(Map<String, dynamic> json)
      : location = json['location'],
        avgTemperature = json['avgTemperature'],
        super.fromJson(json);

  Set.cloneFromAsset(Asset asset) :
        this.fromJson(asset.toJson());
}