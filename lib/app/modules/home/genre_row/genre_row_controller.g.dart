// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_row_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GenreRowController on _GenreRowBase, Store {
  final _$userTagsAtom = Atom(name: '_GenreRowBase.userTags');

  @override
  ObservableFuture<List<TagModel>> get userTags {
    _$userTagsAtom.context.enforceReadPolicy(_$userTagsAtom);
    _$userTagsAtom.reportObserved();
    return super.userTags;
  }

  @override
  set userTags(ObservableFuture<List<TagModel>> value) {
    _$userTagsAtom.context.conditionallyRunInAction(() {
      super.userTags = value;
      _$userTagsAtom.reportChanged();
    }, _$userTagsAtom, name: '${_$userTagsAtom.name}_set');
  }

  final _$currentTagAtom = Atom(name: '_GenreRowBase.currentTag');

  @override
  int get currentTag {
    _$currentTagAtom.context.enforceReadPolicy(_$currentTagAtom);
    _$currentTagAtom.reportObserved();
    return super.currentTag;
  }

  @override
  set currentTag(int value) {
    _$currentTagAtom.context.conditionallyRunInAction(() {
      super.currentTag = value;
      _$currentTagAtom.reportChanged();
    }, _$currentTagAtom, name: '${_$currentTagAtom.name}_set');
  }

  final _$_GenreRowBaseActionController =
      ActionController(name: '_GenreRowBase');

  @override
  void setCurrentTag(int tagId) {
    final _$actionInfo = _$_GenreRowBaseActionController.startAction();
    try {
      return super.setCurrentTag(tagId);
    } finally {
      _$_GenreRowBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadUserTags() {
    final _$actionInfo = _$_GenreRowBaseActionController.startAction();
    try {
      return super.loadUserTags();
    } finally {
      _$_GenreRowBaseActionController.endAction(_$actionInfo);
    }
  }
}
