
import 'package:mobx/mobx.dart';

import '../view_model/ads_state.dart';


part 'main_state.g.dart';

class MainState = _MainStateBase with _$MainState;

abstract class _MainStateBase with Store {
  late AdsState adsState;
  _MainStateBase(){
    adsState = AdsState(main: this as MainState);
  }
}