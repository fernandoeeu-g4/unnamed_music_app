import 'package:flutter/material.dart';

class MeuBotao extends StatelessWidget {
  MeuBotao({
    Key key,
    @required String description,
    @required Function onPressed
  }) : _description = description, _onPressed = onPressed, super(key: key);

  final Function _onPressed;
  final String _description;

  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
        padding: EdgeInsets.all(15),
        child: Text(_description,
          textAlign: TextAlign.justify,
        ),
        color: Colors.black,
        textColor: Colors.white,
        onPressed: _onPressed
    );
  }
}