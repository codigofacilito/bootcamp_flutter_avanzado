
import 'package:autenticacion_oauth/model/user_model.dart';
import 'package:mobx/mobx.dart';

import '../../locator.dart';
import '../../main_store/main_state.dart';
import '../../repository/user_repo.dart';

part 'user_state.g.dart';

class UserState = _UserStateBase with _$UserState;

abstract class _UserStateBase with Store {
  late MainState main;
 final UserRepoImpl _userRepoImpl = sl<UserRepoImpl>();
  _UserStateBase({required this.main});

  @observable
  Observable<UserModel> user = Observable(UserModel());

  @action
  Future<void> fetchUser()async{
    String accessToken = await main.sessionState.getAccessToke();
    UserModel userModel = await _userRepoImpl.getUser(accessToken);
    if(userModel!=null){
      user.value = userModel;
    }

  }
}