import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: height / 5,
            child: Column(),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: height / 4,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.purple,
                  child: Text(
                    "Kenya",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text("3215"),
                          Text(
                            "Confirmed Cases",
                            style: TextStyle(color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text("3215", style: TextStyle(color: Colors.green)),
                          Text("Deaths", style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text("3215", style: TextStyle(color: Colors.green)),
                          Text("Recovered",
                              style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: height / 4,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    "assets/images/male_1.png",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text("Name"),
                      Text("Gender"),
                      Text("Number"),
                      Text("County"),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  "Exposure",
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
