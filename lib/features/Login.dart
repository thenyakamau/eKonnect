import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../injection_container.dart';
import 'presentation/bloc/logindata/logindata_bloc.dart';
import 'presentation/pages/LoginBody.dart';
import 'presentation/widgets/loading_widget.dart';
import 'presentation/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LogindataBloc bloc;
  String gender;
  String f_name = "";
  String l_name = "";
  String p_number = "";
  String id = "";
  DateTime mdate = DateTime.now();

  bool loaded, loading;

  @override
  void initState() {
    bloc = sl<LogindataBloc>();
    setState(() {
      gender = "Male";
    });
    bloc.add(CheckUserProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "ekonnect",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.bold)
              .copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Column(
            children: <Widget>[
              BlocProvider<LogindataBloc>(
                create: (_) => bloc,
                child: BlocBuilder<LogindataBloc, LogindataState>(
                  builder: (context, state) {
                    if (state is LogindataInitial) {
                      return Column(
                        children: <Widget>[
                          Text(
                            "Provide the following details",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          LoginBody(
                            gender: gender,
                            f_name: f_name,
                            l_name: l_name,
                            p_number: p_number,
                            id: id,
                            mdate: mdate,
                            bloc: bloc,
                          ),
                        ],
                      );
                    } else if (state is LoginErrorState) {
                      return Column(
                        children: <Widget>[
                          Text(
                            state.message,
                            style: TextStyle(
                              color: Colors.red[200],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //buildWidgets()
                          LoginBody(
                            gender: gender,
                            f_name: f_name,
                            l_name: l_name,
                            p_number: p_number,
                            id: id,
                            mdate: mdate,
                            bloc: bloc,
                          ),
                        ],
                      );
                    } else if (state is LoginLoadingState) {
                      return LoadingWidget(height: height);
                    } else if (state is LoginLoadedState) {
                      return Container(
                        height: height,
                        child: MyAlertDialog(
                          press: () =>
                              Navigator.of(context).popAndPushNamed('/home'),
                          message: "User data is updated",
                          title: 'Details Added',
                          buttonTitle: 'Home',
                        ),
                      );
                    } else if (state is LoggedUserProfileState) {
                      final user = state.user;
                      gender = user.gender;

                      f_name = user.fname;
                      l_name = user.surname;
                      p_number = user.phone;
                      id = user.national_id;
                      mdate = DateTime.parse(user.dob);

                      return LoginBody(
                        gender: gender,
                        f_name: f_name,
                        l_name: l_name,
                        p_number: p_number,
                        id: id,
                        mdate: mdate,
                        bloc: bloc,
                      );
                    } else {
                      return Container(color: Colors.white);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
