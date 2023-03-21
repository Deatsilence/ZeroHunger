import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? photoUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({this.id, this.name, this.email, this.password, this.photoUrl, this.createdAt, this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}
