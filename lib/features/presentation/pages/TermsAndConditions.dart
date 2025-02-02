import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 10),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Text(
                "These Terms and Conditions, detailed hereinafter, govern your use of the Ekonnect  Application. By accessing and using the Application you are deemed to have understood and agreed to the terms. \n\n The Application is owned and operated by Ekonnect. \n\n EKonnect reserves the right to vary, amend or modify or impose new conditions in these Terms and Conditions at any time without any notification to you. Any such variations, amendments or modifications will be reflected by an update on the Application.You are therefore responsible for checking these Terms and Conditions periodically to be aware of any such changes. Your continued access of this service following the posting of any changes to these Terms and Conditions shall constitute your acceptance and agreement of the same. \n\n",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Colors.red[400],
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed('/'),
                  child: const Text('Cancel', style: TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: RaisedButton(
                  color: Colors.blue[400],
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed('/login'),
                  child: const Text('Accept', style: TextStyle(fontSize: 20)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
