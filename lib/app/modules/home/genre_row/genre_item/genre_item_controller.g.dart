// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GenreItemController on _GenreItemBase, Store {
  final _$valueAtom = Atom(name: '_GenreItemBase.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$_GenreItemBaseActionController =
      ActionController(name: '_GenreItemBase');

  @override
  void increment() {
    final _$actionInfo = _$_GenreItemBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_GenreItemBaseActionController.endAction(_$actionInfo);
    }
  }
}
