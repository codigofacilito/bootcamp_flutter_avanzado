import 'package:autenticacion_oauth/utils/validate.dart';

class UserModel {
  String nickname;
  String name;
  String picture;
  String email;
  bool emailVerified;

  UserModel(
      {this.nickname = "",
      this.name = "",
      this.picture = "",
      this.email = "",
      this.emailVerified = false});

  factory UserModel.toObject(Map<String, Object?> data) {
    Validate validate = Validate(data);
    return UserModel(
      nickname: validate.checkKeyExists(key: "nickname", initialize: ""),
      name: validate.checkKeyExists(key: "name", initialize: ""),
      picture: validate.checkKeyExists(key: "picture", initialize: ""),
      email: validate.checkKeyExists(key: "email", initialize: ""),
      emailVerified: validate.checkKeyExists(key: "email_verified", initialize: false),
    );
  }

  Map<String, dynamic> toMap() => {
        "nickname": nickname,
        "name": name,
        "picture": picture,
        "email": email,
        "email_verified": emailVerified
      };
}
