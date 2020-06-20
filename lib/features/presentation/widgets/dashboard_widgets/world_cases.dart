import 'package:flutter/material.dart';

import '../../../domain/entities/Countries.dart';

class WorldCases extends StatelessWidget {
  const WorldCases({
    Key key,
    @required this.world,
  }) : super(key: key);

  final Countries world;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFE65100).withOpacity(1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            world != null ? world.cases.toString() : '',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Confirmed Cases",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFE91E63).withOpacity(1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            world != null ? world.deaths.toString() : '',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Total \n Deaths",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF228C22).withOpacity(1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            world != null ? world.recovered.toString() : '',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Recovered Cases",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
