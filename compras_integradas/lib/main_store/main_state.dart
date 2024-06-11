
import 'package:mobx/mobx.dart';

import '../view_model/purchases_state.dart';


part 'main_state.g.dart';

class MainState = _MainStateBase with _$MainState;

abstract class _MainStateBase with Store {
  late PurchasesState purchasesState;
  _MainStateBase(){
    purchasesState = PurchasesState(mainState: this as MainState);
  }
}