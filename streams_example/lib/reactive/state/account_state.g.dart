// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Account on _Account, Store {
  late final _$accountModelAtom =
      Atom(name: '_Account.accountModel', context: context);

  @override
  Observable<AccountModel>? get accountModel {
    _$accountModelAtom.reportRead();
    return super.accountModel;
  }

  @override
  set accountModel(Observable<AccountModel>? value) {
    _$accountModelAtom.reportWrite(value, super.accountModel, () {
      super.accountModel = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_Account.isLoading', context: context);

  @override
  Observable<bool> get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(Observable<bool> value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$addAccountAsyncAction =
      AsyncAction('_Account.addAccount', context: context);

  @override
  Future addAccount(AccountModel accountModel) {
    return _$addAccountAsyncAction.run(() => super.addAccount(accountModel));
  }

  @override
  String toString() {
    return '''
accountModel: ${accountModel},
isLoading: ${isLoading}
    ''';
  }
}
