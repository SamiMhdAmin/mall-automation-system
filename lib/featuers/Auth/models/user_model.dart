import 'dart:convert';

// This file is "main.dart"
/*import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'user_model.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  // final String firstName;
  const factory UserModel({
    required String firstName,
    required String lastName,
    required String email,
    required String number,
    required String password,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
*/
class UserModel {
  String firstName;
  String lastName;
  String email;
  String number;
  String password;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.number,
    required this.password,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? number,
    String? password,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      number: number ?? this.number,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'number': number,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      number: map['number'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, email: $email, number: $number, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.number == number &&
        other.password == password;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        number.hashCode ^
        password.hashCode;
  }
}
