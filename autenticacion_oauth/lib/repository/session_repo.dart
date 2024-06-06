import 'package:autenticacion_oauth/data/local/database_app.dart';
import 'package:autenticacion_oauth/utils/constants.dart';

import '../data/local/tables.dart';
import '../data/remote/api.dart';
import '../locator.dart';
import '../model/session_model.dart';

abstract class SessionRepo{
  Future<SessionModel>login(String email,String password);
  Future<SessionModel>refreshAccessToken(int id,String refreshToken);
  Future<SessionModel> saveOrUpdate(Map<String,Object?> data);
  Future<SessionModel>getSession();
  Future<bool> closeSession();
}

class SessionRepoImpl extends SessionRepo{
  final Api _api = sl<Api>();
  final DatabaseApp _databaseApp = sl<DatabaseApp>();

  @override
  Future<SessionModel> login(String email, String pass) async{
    // TODO: implement login
    Map parameter = {
      "grant_type": "password",
      "username": email,
      "password": pass,
      "audience": url+api,
      "scope": "offline_access openid",
      "client_id": clientId,
      "client_secret": clientSecret,
    };

    var jsonResponse = await _api.post("/oauth/token",parameter );

    return saveOrUpdate(jsonResponse);
  }

  @override
  Future<SessionModel> refreshAccessToken(int id,String refreshToken)async {
    // TODO: implement refreshAccessToken
    print("refreshToken $refreshToken");
   Map parameters = {
     "grant_type": "refresh_token",
     "refresh_token": refreshToken,
     "client_id": clientId,
     "client_secret": clientSecret,
   };

   var jsonResponse = await _api.post("/oauth/token", parameters);

   jsonResponse["id"] = id;

   return saveOrUpdate(jsonResponse);
  }

  @override
  Future<SessionModel> saveOrUpdate(Map<String, Object?> data) async {
    // TODO: implement saveOrUpdate
    final database = await _databaseApp.database;
    SessionModel sessionModel = addExpireTime(SessionModel.toObject(data));

    sessionModel.id = (sessionModel.id>0)?
    await database.update(Tables.sessionTable, sessionModel.toMap(),where: "id = ?",whereArgs: [sessionModel.id]):
    await database.insert(Tables.sessionTable, sessionModel.toMap());
    
    return sessionModel;
  }
  
  addExpireTime(SessionModel sessionModel){
    var time = DateTime.now();
    sessionModel.expireTime = time.add(Duration(seconds: int.parse(sessionModel.expireIn))).toString();
    sessionModel.createdAt = time.toString();
    return sessionModel;
  }

  @override
  Future<SessionModel> getSession()async{
    final database = await _databaseApp.database;
    var data = await database.rawQuery("Select * from ${Tables.sessionTable}");
    return SessionModel.toObject(data.first);
  }



  @override
  Future<bool> closeSession() async{
    // TODO: implement closeSession
    final database = await _databaseApp.database;
    return await database.delete(Tables.sessionTable,where:"id = ?",whereArgs: [1] ) > 0;
  }

}