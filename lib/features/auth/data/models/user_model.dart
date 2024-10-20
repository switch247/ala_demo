import 'package:aladia/core/entity/user.dart';

class UserModel extends User {
  UserModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      firstName: map["firstname"] ?? '',
      lastName: map["name"] ?? '',
      email: map["email"] ?? '',
      id: map["id"] ?? '',
    );
  }

  UserModel copywith(
      {String? id, String? email, String? firstName, String? lastName}) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }
}
