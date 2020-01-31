// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_albums_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TopAlbumsController on _TopAlbumsBase, Store {
  final _$topAlbumsByTagAtom = Atom(name: '_TopAlbumsBase.topAlbumsByTag');

  @override
  ObservableFuture<List<AlbumModel>> get topAlbumsByTag {
    _$topAlbumsByTagAtom.context.enforceReadPolicy(_$topAlbumsByTagAtom);
    _$topAlbumsByTagAtom.reportObserved();
    return super.topAlbumsByTag;
  }

  @override
  set topAlbumsByTag(ObservableFuture<List<AlbumModel>> value) {
    _$topAlbumsByTagAtom.context.conditionallyRunInAction(() {
      super.topAlbumsByTag = value;
      _$topAlbumsByTagAtom.reportChanged();
    }, _$topAlbumsByTagAtom, name: '${_$topAlbumsByTagAtom.name}_set');
  }

  final _$_TopAlbumsBaseActionController =
      ActionController(name: '_TopAlbumsBase');

  @override
  void loadTopAlbumsByTag(String tag) {
    final _$actionInfo = _$_TopAlbumsBaseActionController.startAction();
    try {
      return super.loadTopAlbumsByTag(tag);
    } finally {
      _$_TopAlbumsBaseActionController.endAction(_$actionInfo);
    }
  }
}
