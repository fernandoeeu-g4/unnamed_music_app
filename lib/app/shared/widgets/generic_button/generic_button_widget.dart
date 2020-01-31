import 'package:flutter/material.dart';
import 'package:my_music_app/utils/app_constants.dart';

class GenericButtonWidget extends StatelessWidget {
  const GenericButtonWidget(
      {Key key,
      @required double screenWidth,
      @required String label,
      Color color = Colors.black,
      @required Function onTap,
      Color shadowColor = const Color(0xbb000000)})
      : _screenWidth = screenWidth,
        _color = color,
        _label = label,
        _shadowColor = color,
        _onTap = onTap,
        super(key: key);

  final double _screenWidth;
  final Color _color;
  final Color _shadowColor;
  final String _label;
  final Function _onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: _shadowColor,
                blurRadius: 10,
                // spreadRadius: 1,
                offset: Offset(
                  2.0, // horizontal, move right 30
                  2.0, // vertical, move down 30
                ),
              )
            ]),
        width: _screenWidth,
        height: 100,
        child: Center(
          child: Text(
            _label,
            style: TextStyle(
                color: AppConstants.primaryWhite,
                fontSize: 26,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
