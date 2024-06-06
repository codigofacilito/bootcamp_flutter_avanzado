// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserState on _UserStateBase, Store {
  late final _$userAtom = Atom(name: '_UserStateBase.user', context: context);

  @override
  Observable<UserModel> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Observable<UserModel> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$fetchUserAsyncAction =
      AsyncAction('_UserStateBase.fetchUser', context: context);

  @override
  Future<void> fetchUser() {
    return _$fetchUserAsyncAction.run(() => super.fetchUser());
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
