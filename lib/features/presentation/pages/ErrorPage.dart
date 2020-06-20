import 'package:eKonnect/features/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key key,
    @required this.press,
  }) : super(key: key);

  final Function press;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/icons/error.png",
                  width: 160,
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Your location permission is turned off, please turn on the location permission and click on 'refresh'",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            FlatButton.icon(
                onPressed: press,
                icon: Icon(Icons.refresh),
                label: CustomText(text: "refresh")),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
