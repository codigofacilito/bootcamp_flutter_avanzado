// Include generated file
import 'package:mobx/mobx.dart';

import '../model/account_model.dart';

part 'account_state.g.dart';

// This is the class used by rest of your codebase
class Account = _Account with _$Account;

// The store-class
abstract class _Account with Store {

  @observable
  Observable<AccountModel>? accountModel;

  @observable
  Observable<bool> isLoading = Observable(false);


  @action
  addAccount(AccountModel accountModel)async{
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 4),(){
      this.accountModel = Observable(accountModel);
    });

    isLoading.value = false;
  }

}