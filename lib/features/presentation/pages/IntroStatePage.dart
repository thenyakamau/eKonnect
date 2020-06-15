import 'package:eKonnect/features/Login.dart';
import 'package:eKonnect/features/presentation/widgets/login_widgets/login_controller.dart';
import 'package:flutter/material.dart';

class IntroStatePage extends StatelessWidget {
  final Function press;
  const IntroStatePage({Key key, @required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white,
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          LoginButton(press: press, title: "Start")
        ],
      ),
    );
  }
}
