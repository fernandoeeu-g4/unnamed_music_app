import 'package:my_music_app/app/modules/landing/landing_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_music_app/app/modules/landing/landing_page.dart';

class LandingModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LandingController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LandingPage()),
      ];

  static Inject get to => Inject<LandingModule>.of();
}
