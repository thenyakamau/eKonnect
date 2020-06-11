import 'package:eKonnect/core/util/Constants.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.purpleAccent,
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "e",
            style: TextStyle(color: ksecondaryColor),
          ),
          TextSpan(
            text: "Konnect",
            style: TextStyle(color: kPrimaryColor),
          )
        ],
      ),
    ),
    bottom: TabBar(
      tabs: <Widget>[
        Tab(
          text: "Home",
        ),
        Tab(
          text: "Statics",
        ),
        Tab(
          text: "HotLine",
        ),
      ],
    ),
  );
}
