import 'package:flutter/material.dart';

class PageViewContentWidget extends StatelessWidget {
  const PageViewContentWidget({
    Key key, 
    @required TextStyle style, 
    @required String title,
    @required String description,
}) : _style = style, _title = title, _description = description,super(key: key);

  final TextStyle _style;
  final String _title;
  final String _description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _title,
                textAlign: TextAlign.center,
                style: _style,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 25, 50, 0),
                child: Text(
                  _description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xffFBF5F3),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
