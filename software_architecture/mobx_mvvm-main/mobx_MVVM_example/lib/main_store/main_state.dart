import 'package:mobx/mobx.dart';
import 'package:mobx_mvvm_example/view_model/post/post_state.dart';

part 'main_state.g.dart';

class MainState = _MainStateBase with _$MainState;

abstract class _MainStateBase with Store {
  late PostState postState;
  _MainStateBase(){
    postState = PostState(main:  this as MainState);
  }
}