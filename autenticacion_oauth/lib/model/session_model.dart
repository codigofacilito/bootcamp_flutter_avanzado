import 'package:autenticacion_oauth/utils/validate.dart';

class SessionModel{
  int id;
  String accessToken;
  String refreshToken;
  String createdAt;
  String expireIn;
  String tokenType;
  String expireTime;

  SessionModel({this.id=0,this.accessToken="",this.refreshToken="",this.createdAt="",this.expireIn="",this.tokenType="",this.expireTime=""});

  factory SessionModel.toObject(Map<String, dynamic>data){
    Validate validate = Validate(data);
    return SessionModel(
      id: validate.checkKeyExists(key: "id",initialize: 0),
      accessToken: validate.checkKeyExists(key: "access_token",initialize: ""),
      refreshToken: validate.checkKeyExists(key: "refresh_token",initialize: ""),
      expireIn: validate.checkKeyExists(key: "expires_in",initialize: "").toString(),
      tokenType: validate.checkKeyExists(key: "token_type",initialize: ""),
      expireTime: validate.checkKeyExists(key: "expire_time",initialize: ""),
      createdAt: validate.checkKeyExists(key: "created_at",initialize: ""),
    );
  }

  Map<String,dynamic> toMap()=>{
    "id": 1, //1 porque solo existira una cuenta en la base
    "access_token":accessToken,
    "refresh_token":refreshToken,
    "created_at" : createdAt,
    "expires_in" : expireIn,
    "expire_time":expireTime,
    "token_type" : tokenType
  };
}