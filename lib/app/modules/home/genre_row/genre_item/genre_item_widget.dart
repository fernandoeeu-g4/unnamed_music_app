import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_music_app/app/modules/home/genre_row/genre_row_controller.dart';
import 'package:my_music_app/utils/app_constants.dart';

class GenreItemWidget extends StatelessWidget {
  final GenreRowController _genreRowController =
      Modular.get<GenreRowController>();

  GenreItemWidget({
    Key key,
    @required bool active,
    @required String label,
    @required int index,
  })  : _active = active,
        _label = label,
        _index = index,
        super(key: key);

  bool _active;
  String _label;
  int _index;

  @override
  Widget build(BuildContext context) {
    return Observer(
          builder: (_) => Row(
        children: <Widget>[
          SizedBox(
            width: _index == 0 ? 25 : 5,
          ),
          GestureDetector(
            onTap: () {
              _genreRowController.setCurrentTag(_index);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: _genreRowController.currentTag == _index
                ? AppConstants.primaryWhite
                : Color(0x00000000),
                borderRadius: BorderRadius.circular(50)
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      _label,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                          color: _genreRowController.currentTag != _index
                              ? AppConstants.primaryWhite
                              : AppConstants.primaryDarkColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
