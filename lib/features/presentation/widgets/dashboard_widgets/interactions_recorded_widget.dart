import 'package:flutter/material.dart';

import '../../../domain/entities/Interactions.dart';

class InteractionsRecorded extends StatelessWidget {
  const InteractionsRecorded({
    Key key,
    @required this.interaction,
  }) : super(key: key);

  final List<Interaction> interaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Exposure",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "We have recorded " +
                interaction.length.toString() +
                " interactions between you and other people in the last 21 days. " +
                0.toString() +
                " of the people you've interacted with are COVID-19 positive patients." +
                "\n\n Please note :\n An interaction is valid if both parties have installed this app. Share this app with your loved once.",
            style: TextStyle(color: Colors.blue[200], fontSize: 16),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
