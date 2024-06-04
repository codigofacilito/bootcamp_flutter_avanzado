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
      createdAt: validate.checkKeyExists(key: "created_at",initialize: ""),
      expireIn: validate.checkKeyExists(key: "expires_in",initialize: "").toString(),
      expireTime: validate.checkKeyExists(key: "expires_time",initialize: ""),
      tokenType: validate.checkKeyExists(key: "token_type",initialize: ""),
    );
  }

  Map<String,dynamic> toMap()=>{
    "access_token":accessToken,
    "refresh_token":refreshToken,
    "created_at" : createdAt,
    "expires_in" : expireIn,
    "expires_time":expireTime,
    "token_type" : tokenType
  };
}