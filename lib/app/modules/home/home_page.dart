import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:jiffy/jiffy.dart';
import 'package:my_music_app/app/models/userdata.dart';
import 'package:my_music_app/app/modules/home/genre_row/genre_row_module.dart';
import 'package:my_music_app/app/modules/home/genre_row/genre_row_page.dart';
import 'package:my_music_app/app/shared/widgets/generic_button/generic_button_widget.dart';
import 'package:my_music_app/utils/app_constants.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: _screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xff213F4D), const Color(0xff0F2027)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 25),
                child: Text(
                  'Descubra',
                  style: TextStyle(
                      color: AppConstants.primaryWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GenreRowModule(),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GenericButtonWidget(
                    onTap: () {
                      print('going to top artits');
                    },
                    label: 'Top Artists',
                    shadowColor: Color(0xbb44000D),
                    color: Color(0xff44000D),
                    screenWidth: _screenWidth,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GenericButtonWidget(
                    onTap: () {
                      Modular.to.pushNamed('/topAlbums');
                    },
                    label: 'Top Albums',
                    shadowColor: Color(0xbb83142C),
                    color: Color(0xff83142C),
                    screenWidth: _screenWidth,
                  ),
                ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GenericButtonWidget(
                    onTap: () {
                      Hive.box('user').put('isLogged', false);
                      Modular.to.pushReplacementNamed('/signin');
                    },
                    label: 'Top Tracks',
                    shadowColor: Color(0xbbAD1D45),
                    color: Color(0xffAD1D45),
                    screenWidth: _screenWidth,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
