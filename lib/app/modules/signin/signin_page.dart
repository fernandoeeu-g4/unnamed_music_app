import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_music_app/app/modules/signin/signin_controller.dart';
import 'package:my_music_app/app/modules/signin/signin_module.dart';
import 'package:my_music_app/app/modules/signin/widgets/google_button/google_button_widget.dart';
import 'package:my_music_app/app/modules/signin/widgets/loading_animation/LoadingAnimationWidget.dart';
import 'package:my_music_app/app/modules/signin/widgets/pageview/page_view_content_widget.dart';
import 'package:my_music_app/app/modules/signin/widgets/pageview/page_view_dots_indicator.dart';

class SigninPage extends StatefulWidget {
  final String title;
  const SigninPage({Key key, this.title = "Signin"}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final PageController _pageController = PageController();
  SigninController _signinController = SigninModule.to.get();
  final List<IconData> dots =
      List.generate(3, (i) => Icons.fiber_manual_record);
  TextStyle signinPageMainTextStyle = TextStyle(
      color: Color(0xffFBF5F3), fontSize: 60, fontWeight: FontWeight.bold);
  final userBox = Hive.box('user');
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Observer(
        builder: (_) => SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: isDark
                          ? [const Color(0xff213F4D), const Color(0xff0F2027)]
                          : [const Color(0xffEB73B2), const Color(0xFFBF176E)]),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: PageView(
                        onPageChanged: (val) {
                          _signinController.currentPageViewIndex = val;
                        },
                        controller: _pageController,
                        children: <Widget>[
                          PageViewContentWidget(
                            style: signinPageMainTextStyle,
                            title: 'Descubra',
                            description:
                                'Entre e descubra uma infinidade de artistas',
                          ),
                          PageViewContentWidget(
                            style: signinPageMainTextStyle,
                            title: 'Descubra',
                            description:
                                'Entre e descubra uma infinidade de artistas',
                          ),
                          PageViewContentWidget(
                            style: signinPageMainTextStyle,
                            title: 'Descubra',
                            description:
                                'Entre e descubra uma infinidade de artistas',
                          ),
                        ],
                      ),
                    ),
                    PageViewDotsIndicator(
                        indicatorsIconsArray: dots,
                        currentPageViewIndex:
                            _signinController.currentPageViewIndex),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 80),
                      child: GoogleButtonWidget(
                        onTap: () async {
                          print('tapped login button, from sign_in_page');
                          try {
                            userBox.put('signinLoading', true);
                            var response = await _signinController.doLogin();
                            userBox.put('signinLoading', false);
                            if (response) {
                              userBox.put('isLogged', true);
                              Modular.to.pushReplacementNamed('/home');
                            }
                          } catch (e) {
                            userBox.put('isLogged', false);
                            userBox.put('signinLoading', false);
                            EasyDialog(
                                title: Text('Erro ao logar'),
                                description: Text('Tente novamente, bro!'));
                          }
                        },
                        screenWidth: _screenWidth,
                        loading: false,
                      ),
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: userBox.listenable(),
                builder: (BuildContext context, box, _) {
                  return box.get('signinLoading')
                      ? LoadingAnimationWidget(
                          height: _screenHeight,
                          width: _screenWidth,
                        )
                      : Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
