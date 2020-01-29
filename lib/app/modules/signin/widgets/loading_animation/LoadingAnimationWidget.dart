import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAnimationWidget extends StatelessWidget {
  LoadingAnimationWidget(
      {Key key, @required double height, @required double width})
      : _height = height,
        _width = width,
        super(key: key);

  double _width;
  double _height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      height: _height,
      width: _width,
      child: Container(
        decoration: BoxDecoration(color: Color(0xcc000000)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitPumpingHeart(
                color: Colors.white,
                size: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text('Loading...',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
