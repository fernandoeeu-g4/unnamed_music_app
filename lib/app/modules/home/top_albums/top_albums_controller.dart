import 'package:mobx/mobx.dart';
import 'package:my_music_app/app/models/AlbumModel.dart';
import 'package:my_music_app/app/repositories/album_repository.dart';

part 'top_albums_controller.g.dart';

class TopAlbumsController = _TopAlbumsBase with _$TopAlbumsController;

abstract class _TopAlbumsBase with Store {

  _TopAlbumsBase(this._albumRepository);

  AlbumRepository _albumRepository;

  @observable
  ObservableFuture<List<AlbumModel>> topAlbumsByTag;

  @action
  void loadTopAlbumsByTag(String tag) {
    topAlbumsByTag = _albumRepository.getTopAlbumsByTag(tag).asObservable();
  }
}
