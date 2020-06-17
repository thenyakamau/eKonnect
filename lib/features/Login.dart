import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../core/util/Constants.dart';
import '../injection_container.dart';
import 'presentation/bloc/logindata/logindata_bloc.dart';
import 'presentation/widgets/loading_widget.dart';
import 'presentation/widgets/login_widgets/login_wigets.dart';
import 'presentation/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LogindataBloc bloc;
  String gender;
  String f_name, l_name, p_number, id, mdate;
  TextEditingController f_controller,
      l_controller,
      p_controller,
      id_controller,
      date_controller;
  bool loaded, loading;
  final format = DateFormat("dd/MM/yyyy");
  @override
  void initState() {
    bloc = sl<LogindataBloc>();

    setState(() {
      gender = "Male";
      loaded = false;
      loading = false;

      f_controller = TextEditingController();
      l_controller = TextEditingController();
      p_controller = TextEditingController();
      id_controller = TextEditingController();
      date_controller = TextEditingController();
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
                          buildWidgets(),
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
                          buildWidgets()
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
                      f_controller = TextEditingController(text: user.fname);
                      l_controller = TextEditingController(text: user.surname);
                      p_controller = TextEditingController(text: user.phone);
                      id_controller =
                          TextEditingController(text: user.national_id);
                      date_controller = TextEditingController(text: user.dob);
                      return buildWidgets();
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

  Column buildWidgets() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            decoration: InputDecoration(
              // border: const OutlineInputBorder(),
              labelText: "First Name",
              labelStyle: kLabelStyle,
              // contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
              ),
              hintText: 'Enter your first name',
              hintStyle: kHintTextStyle,
            ),
            controller: f_controller,
            onChanged: (value) {
              setState(() {
                f_name = value;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Last Name",
              labelStyle: kLabelStyle,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
              ),
              hintText: 'Enter your last name',
              hintStyle: kHintTextStyle,
            ),
            controller: l_controller,
            onChanged: (value) {
              setState(() {
                l_name = value;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Phone Number",
              labelStyle: kLabelStyle,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.call,
              ),
              hintText: 'Enter your phone number',
              hintStyle: kHintTextStyle,
            ),
            controller: p_controller,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                p_number = value;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "ID Number",
              labelStyle: kLabelStyle,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.credit_card,
              ),
              hintText: 'Enter your id',
              hintStyle: kHintTextStyle,
            ),
            controller: id_controller,
            onChanged: (value) {
              setState(() {
                id = value;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Select your Gender",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: "Male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                    Text("Male")
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Radio(
                    value: "Female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  Text("Female")
                ],
              ))
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Select your Date of birth",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: DateTimeField(
            format: format,
            decoration: InputDecoration(
              labelText: "D.O.B",
              labelStyle: kLabelStyle,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.calendar_today,
              ),
              hintText: 'Enter your date of birth',
              hintStyle: kHintTextStyle,
            ),
            controller: date_controller,
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100),
              );
            },
            onChanged: (value) {
              int day = value.day;
              int month = value.month;
              int year = value.year;
              setState(() {
                mdate = '$day/$month/$year';
              });
            },
          ),
        ),
        SizedBox(height: 10),
        LoginButton(
          press: () {
            print(f_name);
            return bloc.add(
              LoginUserEvent(
                f_name: f_name,
                l_name: l_name,
                p_number: p_number,
                id: id,
                gender: gender,
                dob: mdate,
              ),
            );
          },
          title: "Submit",
        )
      ],
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
