import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key key, @required this.press, @required this.title})
      : super(key: key);

  final Function press;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: press,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color.fromRGBO(136, 14, 79, 1),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: "OpenSans",
          ),
        ),
      ),
    );
  }
}
