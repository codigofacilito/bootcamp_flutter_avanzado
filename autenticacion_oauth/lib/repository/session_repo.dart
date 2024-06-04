import 'package:autenticacion_oauth/utils/constants.dart';

import '../data/remote/api.dart';
import '../locator.dart';
import '../model/session_model.dart';

abstract class SessionRepo{
  Future<SessionModel>login(String email,String password);
  Future<SessionModel>refreshAccessToken(String refreshToken);
}

class SessionRepoImpl extends SessionRepo{
  final Api _api = sl<Api>();

  @override
  Future<SessionModel> login(String email, String pass) async{
    // TODO: implement login
    Map parameter = {
      grantType: "password",
      userName: email,
      password: pass,
      audience:url+api,
      scope: "offline_access openid",
      clientIdKey:clientId,
      clientSecretKey:clientSecret,
    };

    var jsonResponse = await _api.post("/oauth/token",parameter );
    print("jsonResponse $jsonResponse");
    return SessionModel.toObject(jsonResponse);
  }

  @override
  Future<SessionModel> refreshAccessToken(String refreshToken) {
    // TODO: implement refreshAccessToken
    throw UnimplementedError();
  }

}