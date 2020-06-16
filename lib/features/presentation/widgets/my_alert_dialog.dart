import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog(
      {Key key,
      @required this.press,
      @required this.message,
      @required this.title,
      @required this.buttonTitle})
      : super(key: key);

  final Function press;
  final String title, message, buttonTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).accentColor,
      title: Text(title, style: TextStyle(color: Colors.white)),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(message, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(buttonTitle, style: TextStyle(color: Colors.white)),
          onPressed: press,
        ),
      ],
    );
  }
}
