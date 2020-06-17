import 'package:eKonnect/core/util/Constants.dart';
import 'package:eKonnect/features/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HotLinePage extends StatefulWidget {
  const HotLinePage({Key key}) : super(key: key);

  @override
  _HotLinePageState createState() => _HotLinePageState();
}

class _HotLinePageState extends State<HotLinePage> {
  final controller = ScrollController();
  double offset = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyHeader(
            image: "assets/icons/coronadr.svg",
            textTop: "Get to know",
            textBottom: "About Covid-19.",
            offset: offset,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Symptoms",
                  style: kTitleTextstyle,
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SymptomCard(
                        image: "assets/images/headache.png",
                        title: "Headache",
                        isActive: true,
                      ),
                      SymptomCard(
                        image: "assets/images/caugh.png",
                        title: "Caugh",
                      ),
                      SymptomCard(
                        image: "assets/images/fever.png",
                        title: "Fever",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text("Prevention", style: kTitleTextstyle),
                SizedBox(height: 20),
                PreventCard(
                  text:
                      "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                  image: "assets/images/wear_mask.png",
                  title: "Wear face mask",
                ),
                PreventCard(
                  text:
                      "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                  image: "assets/images/wash_hands.png",
                  title: "Wash your hands",
                ),
                SizedBox(height: 50),
              ],
            ),
          )
        ],
      ),
    );
  }
}
