import 'package:my_music_app/app/modules/signin/widgets/google_button/google_button_controller.dart';
import 'package:my_music_app/app/modules/signin/signin_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_music_app/app/modules/signin/signin_page.dart';
import 'package:dio/dio.dart';
import 'package:my_music_app/app/repositories/user_repository.dart';

class SigninModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => GoogleButtonController()),
        Bind((i) => SigninController(i.get<UserRepository>())),
        Bind((i) => UserRepository(i.get<Dio>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SigninPage()),
      ];

  static Inject get to => Inject<SigninModule>.of();
}
