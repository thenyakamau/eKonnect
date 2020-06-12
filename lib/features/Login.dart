import 'package:flutter/material.dart';

import '../core/util/Constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String f_name, l_name, p_number, id, gender, date;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop()),
        title: Text(
          "ekonnect",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.bold)
              .copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Column(
            children: <Widget>[
              Text(
                "Provide the following details",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    // border: const OutlineInputBorder(),
                    labelText: "First Name",
                    labelStyle: kLabelStyle,
                    // contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    hintText: 'Enter your first name',
                    hintStyle: kHintTextStyle,
                  ),
                  onChanged: (value) {
                    f_name = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    labelStyle: kLabelStyle,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    hintText: 'Enter your last name',
                    hintStyle: kHintTextStyle,
                  ),
                  onChanged: (value) {
                    l_name = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    labelStyle: kLabelStyle,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.call,
                    ),
                    hintText: 'Enter your phone number',
                    hintStyle: kHintTextStyle,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    p_number = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "ID Number",
                    labelStyle: kLabelStyle,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.credit_card,
                    ),
                    hintText: 'Enter your id',
                    hintStyle: kHintTextStyle,
                  ),
                  onChanged: (value) {
                    id = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Select your Gender",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                "Select your Date of birth",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "D.O.B",
                    labelStyle: kLabelStyle,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.calendar_today,
                    ),
                    hintText: 'Enter your date of birth',
                    hintStyle: kHintTextStyle,
                  ),
                  keyboardType: TextInputType.datetime,
                  onChanged: (value) {
                    date = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.red[400],
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
