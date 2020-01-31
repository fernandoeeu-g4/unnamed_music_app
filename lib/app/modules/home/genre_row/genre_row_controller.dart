import 'package:mobx/mobx.dart';
import 'package:my_music_app/app/models/TagModel.dart';
import 'package:my_music_app/app/repositories/user_repository.dart';
part 'genre_row_controller.g.dart';

class GenreRowController = _GenreRowBase with _$GenreRowController;

abstract class _GenreRowBase with Store {

  _GenreRowBase(this._userRepository) {
    loadUserTags();
  }

  final UserRepository _userRepository;

  @observable
  ObservableFuture<List<TagModel>> userTags;

  @observable
  int currentTag = 0;

  @action
  void setCurrentTag(int tagId) {
    currentTag = tagId;
  }

  @action
  void loadUserTags() {
    userTags = _userRepository.getUserTags().asObservable();
  }


}
