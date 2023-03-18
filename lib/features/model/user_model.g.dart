// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      photoUrl: json['photoUrl'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : CreatedAt.fromJson(json['createdAt'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] == null
          ? null
          : CreatedAt.fromJson(json['updatedAt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

CreatedAt _$CreatedAtFromJson(Map<String, dynamic> json) => CreatedAt(
      iSeconds: json['iSeconds'] as int?,
      iNanoseconds: json['iNanoseconds'] as int?,
    );

Map<String, dynamic> _$CreatedAtToJson(CreatedAt instance) => <String, dynamic>{
      'iSeconds': instance.iSeconds,
      'iNanoseconds': instance.iNanoseconds,
    };
