import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class Item {
  String? id;
  String? title;
  String? description;
  List<String>? photoUrls;
  String? userId;
  String? categoryName;
  Location? location;
  DateTime? createdAt;
  DateTime? updatedAt;

  Item({
    this.id,
    this.title,
    this.description,
    this.photoUrls,
    this.userId,
    this.categoryName,
    this.location,
    this.createdAt,
    this.updatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return _$ItemFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ItemToJson(this);
  }
}

@JsonSerializable()
class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LocationToJson(this);
  }
}
