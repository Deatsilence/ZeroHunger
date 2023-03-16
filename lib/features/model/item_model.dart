class Item {
  String? id;
  String? title;
  String? description;
  int? price;
  List<String>? photoUrls;
  String? userId;
  String? categoryId;
  Location? location;
  CreatedAt? createdAt;
  CreatedAt? updatedAt;

  Item(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.photoUrls,
      this.userId,
      this.categoryId,
      this.location,
      this.createdAt,
      this.updatedAt});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    photoUrls = json['photoUrls'].cast<String>();
    userId = json['userId'];
    categoryId = json['categoryId'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    createdAt = json['createdAt'] != null ? CreatedAt.fromJson(json['createdAt']) : null;
    updatedAt = json['updatedAt'] != null ? CreatedAt.fromJson(json['updatedAt']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['photoUrls'] = photoUrls;
    data['userId'] = userId;
    data['categoryId'] = categoryId;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (createdAt != null) {
      data['createdAt'] = createdAt!.toJson();
    }
    if (updatedAt != null) {
      data['updatedAt'] = updatedAt!.toJson();
    }
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
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
