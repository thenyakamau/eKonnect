import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/util/Constants.dart';
import '../bloc/logindata/logindata_bloc.dart';
import '../widgets/login_widgets/login_wigets.dart';

class LoginBody extends StatefulWidget {
  const LoginBody(
      {Key key,
      @required this.gender,
      @required this.f_name,
      @required this.l_name,
      @required this.p_number,
      @required this.id,
      @required this.mdate,
      @required this.bloc})
      : super(key: key);

  final String gender;
  final String f_name;
  final String l_name;
  final String p_number;
  final String id;
  final DateTime mdate;
  final LogindataBloc bloc;

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String fname, surname, phone, n_id, dob, mgender;

  @override
  void initState() {
    super.initState();
    setState(() {
      fname = widget.f_name;
      surname = widget.l_name;
      phone = widget.p_number;
      n_id = widget.id;
      dob = widget.mdate.toString();
      mgender = widget.gender == null ? widget.gender : "Male";
    });
  }

  final format = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            initialValue: widget.f_name,
            decoration: InputDecoration(
              labelText: "First Name",
              labelStyle: kLabelStyle,
              prefixIcon: Icon(
                Icons.person,
              ),
              hintText: 'Enter your first name',
              hintStyle: kHintTextStyle,
            ),
            onChanged: (value) {
              setState(() {
                fname = value;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            initialValue: widget.l_name,
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
            onChanged: (value) {
              setState(() {
                surname = value;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            initialValue: widget.p_number,
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
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                phone = value;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            initialValue: widget.id,
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
            onChanged: (value) {
              setState(() {
                n_id = value;
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
                      groupValue: mgender,
                      onChanged: (value) {
                        setState(() {
                          mgender = value;
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
                    groupValue: mgender,
                    onChanged: (value) {
                      setState(() {
                        mgender = value;
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
            initialValue: widget.mdate,
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
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100),
              );
            },
            onChanged: (value) {
              setState(() {
                dob = value.toString();
              });
            },
          ),
        ),
        SizedBox(height: 10),
        LoginButton(
          press: () {
            print(fname);
            return widget.bloc.add(
              LoginUserEvent(
                f_name: fname,
                l_name: surname,
                p_number: phone,
                id: n_id,
                gender: mgender,
                dob: dob,
              ),
            );
          },
          title: "Submit",
        )
      ],
    );
  }
}
