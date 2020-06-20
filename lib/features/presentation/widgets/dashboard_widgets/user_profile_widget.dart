import 'package:flutter/material.dart';

import '../../../domain/entities/UserProfile.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    Key key,
    @required this.user,
  }) : super(key: key);

  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              user != null
                  ? user.gender == "Male"
                      ? "assets/images/male_1.png"
                      : "assets/images/female_1.png"
                  : 'assets/images/male_1.png',
              fit: BoxFit.fill,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  user != null ? user.fname : '',
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Text(user != null ? user.gender : ''),
                SizedBox(height: 10),
                Text(user != null ? user.phone : ''),
                SizedBox(height: 10),
                Text(user != null ? user.location : ''),
              ],
            ),
            SizedBox(width: 10),
            Column(
              children: <Widget>[
                IconButton(
                  alignment: Alignment.topRight,
                  icon: Icon(Icons.edit, color: Colors.grey),
                  onPressed: () {
                    return Navigator.of(context).pushNamed("/login");
                  },
                ),
                SizedBox(height: 60)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
