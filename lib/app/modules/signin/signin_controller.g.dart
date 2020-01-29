// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SigninController on _SigninBase, Store {
  final _$isSignedInAtom = Atom(name: '_SigninBase.isSignedIn');

  @override
  bool get isSignedIn {
    _$isSignedInAtom.context.enforceReadPolicy(_$isSignedInAtom);
    _$isSignedInAtom.reportObserved();
    return super.isSignedIn;
  }

  @override
  set isSignedIn(bool value) {
    _$isSignedInAtom.context.conditionallyRunInAction(() {
      super.isSignedIn = value;
      _$isSignedInAtom.reportChanged();
    }, _$isSignedInAtom, name: '${_$isSignedInAtom.name}_set');
  }

  final _$showErrorDialogAtom = Atom(name: '_SigninBase.showErrorDialog');

  @override
  bool get showErrorDialog {
    _$showErrorDialogAtom.context.enforceReadPolicy(_$showErrorDialogAtom);
    _$showErrorDialogAtom.reportObserved();
    return super.showErrorDialog;
  }

  @override
  set showErrorDialog(bool value) {
    _$showErrorDialogAtom.context.conditionallyRunInAction(() {
      super.showErrorDialog = value;
      _$showErrorDialogAtom.reportChanged();
    }, _$showErrorDialogAtom, name: '${_$showErrorDialogAtom.name}_set');
  }

  final _$currentPageViewIndexAtom =
      Atom(name: '_SigninBase.currentPageViewIndex');

  @override
  int get currentPageViewIndex {
    _$currentPageViewIndexAtom.context
        .enforceReadPolicy(_$currentPageViewIndexAtom);
    _$currentPageViewIndexAtom.reportObserved();
    return super.currentPageViewIndex;
  }

  @override
  set currentPageViewIndex(int value) {
    _$currentPageViewIndexAtom.context.conditionallyRunInAction(() {
      super.currentPageViewIndex = value;
      _$currentPageViewIndexAtom.reportChanged();
    }, _$currentPageViewIndexAtom,
        name: '${_$currentPageViewIndexAtom.name}_set');
  }

  final _$doLogoutAsyncAction = AsyncAction('doLogout');

  @override
  Future doLogout() {
    return _$doLogoutAsyncAction.run(() => super.doLogout());
  }

  final _$doLoginAsyncAction = AsyncAction('doLogin');

  @override
  Future doLogin() {
    return _$doLoginAsyncAction.run(() => super.doLogin());
  }

  final _$_SigninBaseActionController = ActionController(name: '_SigninBase');

  @override
  void setIsSignedIn(dynamic val) {
    final _$actionInfo = _$_SigninBaseActionController.startAction();
    try {
      return super.setIsSignedIn(val);
    } finally {
      _$_SigninBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleShowErrorDialog() {
    final _$actionInfo = _$_SigninBaseActionController.startAction();
    try {
      return super.toggleShowErrorDialog();
    } finally {
      _$_SigninBaseActionController.endAction(_$actionInfo);
    }
  }
}
