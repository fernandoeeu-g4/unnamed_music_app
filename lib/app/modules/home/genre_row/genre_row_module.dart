import 'package:my_music_app/app/modules/home/genre_row/genre_item/genre_item_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_music_app/app/modules/home/genre_row/genre_row_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_music_app/app/modules/home/genre_row/genre_row_page.dart';
import 'package:my_music_app/app/repositories/user_repository.dart';

class GenreRowModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => GenreItemController()),
        Bind((i) => GenreItemController()),
        Bind((i) => GenreRowController(i.get<UserRepository>())),
        Bind((i) => UserRepository(i.get<Dio>())),
        Bind((i) => Dio())
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => GenreRowPage()),
      ];

  static Inject get to => Inject<GenreRowModule>.of();

  @override
  // TODO: implement view
  Widget get view => GenreRowPage();
}
