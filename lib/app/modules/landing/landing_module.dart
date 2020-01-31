import 'package:my_music_app/app/modules/home/home_module.dart';
import 'package:my_music_app/app/modules/home/top_albums/top_albums_module.dart';
import 'package:my_music_app/app/modules/landing/landing_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_music_app/app/modules/landing/landing_page.dart';
import 'package:my_music_app/app/modules/signin/signin_module.dart';

class LandingModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LandingController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LandingPage()),
        Router('/home', module: HomeModule()),
        Router('/signin', module: SigninModule()),
        Router('/topAlbums', module: TopAlbumsModule())
      ];

  static Inject get to => Inject<LandingModule>.of();
}
