import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';

PageModel buildPageModel(
    BuildContext context, String image, String title, String message) {
  return PageModel(
    color: Colors.white,
    heroAssetPath: image,
    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: Theme.of(context).accentColor,
          fontSize: 34.0,
        )),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.grey,
            fontSize: 18.0,
          )),
    ),
    iconAssetPath: 'assets/images/circle.png',
  );
}
