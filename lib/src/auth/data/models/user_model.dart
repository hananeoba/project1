import 'dart:convert';

import 'package:project1/core/utils/typedef.dart';
import 'package:project1/src/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.createdAt,
      required super.name,
      required super.avatar});

  const UserModel.empty()
      : this(
            avatar: 'empty string',
            createdAt: 'empty string',
            id: '0',
            name: 'empty string');

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : this(
            id: map['id'] as String,
            createdAt: map['createdAt'] as String,
            name: map['name'] as String,
            avatar: map['avatar'] as String);

  // to update the user model
  UserModel copyWith({
    String? id,
    String? createdAt,
    String? name,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }

  DataMap toMap() => {
        'id': super.id,
        'createdAt': super.createdAt,
        'name': super.name,
        'avatar': super.avatar,
      };
  String toJson() => jsonEncode(toMap());
}
