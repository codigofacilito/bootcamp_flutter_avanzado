import 'package:autenticacion_oauth/main_store/main_state.dart';
import 'package:autenticacion_oauth/repository/session_repo.dart';
import 'package:mobx/mobx.dart';

import '../../locator.dart';
import '../../model/session_model.dart';

part 'session_state.g.dart';

class SessionState = _SessionStateBase with _$SessionState;

abstract class _SessionStateBase with Store {
  late MainState main;

  _SessionStateBase({required  this.main});

  final SessionRepoImpl _sessionRepoImpl = sl<SessionRepoImpl>();
  @observable
  Observable<SessionModel?> session = Observable(null);

  @observable
  Observable<bool> loading = Observable(false);
  @action
  Future login(String email,String password)async{
    loading.value = true;
    SessionModel sessionModel = await _sessionRepoImpl.login(email, password);
    session.value = sessionModel;
    loading.value = false;
  }

}