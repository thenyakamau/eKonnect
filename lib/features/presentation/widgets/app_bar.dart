import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      "ekonnect",
      style: Theme.of(context)
          .textTheme
          .headline6
          .copyWith(fontWeight: FontWeight.bold)
          .copyWith(color: Colors.white),
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
