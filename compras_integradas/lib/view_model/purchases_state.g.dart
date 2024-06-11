// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchases_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PurchasesState on _PurchasesStateBase, Store {
  late final _$isAvailableAtom =
      Atom(name: '_PurchasesStateBase.isAvailable', context: context);

  @override
  Observable<bool> get isAvailable {
    _$isAvailableAtom.reportRead();
    return super.isAvailable;
  }

  @override
  set isAvailable(Observable<bool> value) {
    _$isAvailableAtom.reportWrite(value, super.isAvailable, () {
      super.isAvailable = value;
    });
  }

  late final _$purchasePendingAtom =
      Atom(name: '_PurchasesStateBase.purchasePending', context: context);

  @override
  Observable<bool> get purchasePending {
    _$purchasePendingAtom.reportRead();
    return super.purchasePending;
  }

  @override
  set purchasePending(Observable<bool> value) {
    _$purchasePendingAtom.reportWrite(value, super.purchasePending, () {
      super.purchasePending = value;
    });
  }

  late final _$queryErrorAtom =
      Atom(name: '_PurchasesStateBase.queryError', context: context);

  @override
  Observable<String> get queryError {
    _$queryErrorAtom.reportRead();
    return super.queryError;
  }

  @override
  set queryError(Observable<String> value) {
    _$queryErrorAtom.reportWrite(value, super.queryError, () {
      super.queryError = value;
    });
  }

  late final _$subscriptionsAtom =
      Atom(name: '_PurchasesStateBase.subscriptions', context: context);

  @override
  List<ProductDetails> get subscriptions {
    _$subscriptionsAtom.reportRead();
    return super.subscriptions;
  }

  @override
  set subscriptions(List<ProductDetails> value) {
    _$subscriptionsAtom.reportWrite(value, super.subscriptions, () {
      super.subscriptions = value;
    });
  }

  late final _$productsAtom =
      Atom(name: '_PurchasesStateBase.products', context: context);

  @override
  List<ProductDetails> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductDetails> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$currentIndexSubsAtom =
      Atom(name: '_PurchasesStateBase.currentIndexSubs', context: context);

  @override
  Observable<int> get currentIndexSubs {
    _$currentIndexSubsAtom.reportRead();
    return super.currentIndexSubs;
  }

  @override
  set currentIndexSubs(Observable<int> value) {
    _$currentIndexSubsAtom.reportWrite(value, super.currentIndexSubs, () {
      super.currentIndexSubs = value;
    });
  }

  late final _$currentSubsAtom =
      Atom(name: '_PurchasesStateBase.currentSubs', context: context);

  @override
  Observable<ProductDetails?>? get currentSubs {
    _$currentSubsAtom.reportRead();
    return super.currentSubs;
  }

  @override
  set currentSubs(Observable<ProductDetails?>? value) {
    _$currentSubsAtom.reportWrite(value, super.currentSubs, () {
      super.currentSubs = value;
    });
  }

  late final _$_PurchasesStateBaseActionController =
      ActionController(name: '_PurchasesStateBase', context: context);

  @override
  dynamic addCurrentSubs(int index) {
    final _$actionInfo = _$_PurchasesStateBaseActionController.startAction(
        name: '_PurchasesStateBase.addCurrentSubs');
    try {
      return super.addCurrentSubs(index);
    } finally {
      _$_PurchasesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isAvailable: ${isAvailable},
purchasePending: ${purchasePending},
queryError: ${queryError},
subscriptions: ${subscriptions},
products: ${products},
currentIndexSubs: ${currentIndexSubs},
currentSubs: ${currentSubs}
    ''';
  }
}
