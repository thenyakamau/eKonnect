import 'package:eKonnect/features/Login.dart';
import 'package:eKonnect/features/presentation/widgets/login_widgets/login_controller.dart';
import 'package:eKonnect/features/presentation/widgets/widgets.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';

class IntroStatePage extends StatelessWidget {
  final Function press;
  const IntroStatePage({Key key, @required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FancyOnBoarding(
            doneButtonBackgroundColor: Theme.of(context).accentColor,
            doneButtonText: "Done",
            pageList: [
              buildPageModel(
                context,
                'assets/images/social.png',
                'How it works?',
                'If one of the users of this app is tested corona positive, we will retrive the list of users he has been in contact with for the past 30 days',
              ),
              buildPageModel(
                context,
                'assets/images/q.png',
                'Close contact',
                'Everytime you come to close contact with another users, those cases will be safely stored in our database!',
              ),
              buildPageModel(
                context,
                'assets/images/mobile.png',
                'Privacy',
                'Your phone number is the only detail needed for you to use the Corona out app',
              ),
            ],
            onDoneButtonPressed: press,
            onSkipButtonPressed: press,
          ),
          Positioned.fill(
            bottom: 10,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomText(
                  text: "< swipe left",
                  color: Colors.grey.withOpacity(0.5),
                )),
          )
        ],
      ),
    );
  }
}
