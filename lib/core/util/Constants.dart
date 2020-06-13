import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
const kPrimaryColor = Color(0xFFFFC61F);
const ksecondaryColor = Color(0xFFB5BFD0);
const kTextColor = Color(0xFF50505D);
const kTextLightColor = Color(0xFF6A727D);

const CACHED_USER = "CACHED_USER";
const CACHED_UUID = "CACHED_UUID";
const CACHED_USER_COUNTY = "CACHED_USER_COUNTY";

const String SERVER_FAILURE_MESSAGE = "Server Failure";
const String CACHE_FAILURE_MESSAGE = "Cache Failure";
const String INPUT_FAILURE_MESSAGE = "Input Failure";
const String PERMISION_DENIED = "please grant permission";
const String PERMISION_NEVER_ASKED =
    "permission denied- please enable it from app settings";
