import 'package:autenticacion_oauth/data/remote/api.dart';

import '../locator.dart';
import '../model/user_model.dart';

abstract class UserRepo{
  Future<UserModel>getUser(String accessToken);
}

class UserRepoImpl extends UserRepo{
  final Api _api = sl<Api>();
  @override
  Future<UserModel> getUser(String accessToken) async{
    // TODO: implement getUser
    var jsonResponse = await _api.get("/userinfo",accessToken: accessToken);
    print("jsonResponse user $jsonResponse");
    return UserModel.toObject(jsonResponse);
  }
}