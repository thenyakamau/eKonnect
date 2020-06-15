import 'package:eKonnect/features/presentation/bloc/splashscreenbloc/splashscreen_bloc.dart';
import 'package:eKonnect/features/presentation/pages/IntroStatePage.dart';
import 'package:eKonnect/features/presentation/pages/TermsAndConditions.dart';
import 'package:eKonnect/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          } else {
            return TermsAndConditions();
          }
        },
      ),
    );
  }
}
