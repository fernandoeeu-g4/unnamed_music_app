import 'package:dio/dio.dart';
import 'package:my_music_app/app/modules/home/top_albums/top_albums_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_music_app/app/modules/home/top_albums/top_albums_page.dart';
import 'package:my_music_app/app/repositories/album_repository.dart';

class TopAlbumsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TopAlbumsController(i.get<AlbumRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => TopAlbumsPage()),
      ];

  static Inject get to => Inject<TopAlbumsModule>.of();
}
