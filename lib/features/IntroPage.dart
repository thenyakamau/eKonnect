import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../injection_container.dart';
import 'presentation/bloc/splashscreenbloc/splashscreen_bloc.dart';
import 'presentation/pages/ErrorPage.dart';
import 'presentation/pages/IntroStatePage.dart';
import 'presentation/pages/TermsAndConditions.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  SplashscreenBloc bloc;
  @override
  void initState() {
    bloc = sl<SplashscreenBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashscreenBloc>(
      create: (_) => bloc,
      child: BlocBuilder<SplashscreenBloc, SplashscreenState>(
        builder: (context, state) {
          if (state is SplashscreenInitial) {
            return IntroStatePage(press: () => bloc.add(ScrollIntroPages()));
          } else if (state is SplashTermsPageState) {
            return TermsAndConditions();
          } else if (state is SplashPermissionDeniedState) {
            return ErrorPage(press: () => bloc.add(ScrollIntroPages()));
          } else {
            return Container(color: Colors.white);
          }
        },
      ),
    );
  }
}
