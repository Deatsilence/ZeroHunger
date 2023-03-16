class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? photoUrl;
  CreatedAt? createdAt;
  CreatedAt? updatedAt;

  User({this.id, this.name, this.email, this.password, this.photoUrl, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    photoUrl = json['photoUrl'];
    createdAt = json['createdAt'] != null ? CreatedAt.fromJson(json['createdAt']) : null;
    updatedAt = json['updatedAt'] != null ? CreatedAt.fromJson(json['updatedAt']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['photoUrl'] = photoUrl;
    if (createdAt != null) {
      data['createdAt'] = createdAt!.toJson();
    }
    if (updatedAt != null) {
      data['updatedAt'] = updatedAt!.toJson();
    }
    return data;
  }
}

class CreatedAt {
  int? iSeconds;
  int? iNanoseconds;

  CreatedAt({this.iSeconds, this.iNanoseconds});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    iSeconds = json['_seconds'];
    iNanoseconds = json['_nanoseconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_seconds'] = iSeconds;
    data['_nanoseconds'] = iNanoseconds;
    return data;
  }
}
