import 'package:eKonnect/features/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BlueToothOffWidget extends StatelessWidget {
  const BlueToothOffWidget({
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
                  "assets/images/off.png",
                  width: 160,
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Your Bluetooth is turned off, please turn on the bluetooth and click on 'refresh'",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
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
