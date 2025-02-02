import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../injection_container.dart';
import 'presentation/bloc/splashscreenbloc/splashscreen_bloc.dart';
import 'presentation/widgets/loading_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashscreenBloc bloc;

  @override
  void initState() {
    bloc = sl<SplashscreenBloc>();
    Timer(Duration(seconds: 5), () => bloc.add(CheckFirstTimeEvent()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    return BlocProvider<SplashscreenBloc>(
      create: (_) => bloc,
      child: BlocBuilder<SplashscreenBloc, SplashscreenState>(
        builder: (context, state) {
          if (state is SplashscreenInitial) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75),
                            image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  LoadingWidget(height: height)
                ],
              ),
            );
          } else if (state is FirstTimeState) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => Navigator.of(context).pushReplacementNamed('/intro'),
            );
            return Container(color: Colors.white);
          } else if (state is SplashLoginState) {
            print("login");
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => Navigator.of(context).pushReplacementNamed('/login'),
            );
            return Container(color: Theme.of(context).primaryColor);
          } else if (state is SplashHomeState) {
            print("home");
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => Navigator.of(context).pushReplacementNamed('/home'),
            );
            return Container(color: Theme.of(context).primaryColor);
          } else {
            return Container(color: Theme.of(context).primaryColor);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
