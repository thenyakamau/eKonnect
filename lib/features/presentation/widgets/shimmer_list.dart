import 'package:eKonnect/features/presentation/widgets/shimmer_object.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;

    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        offset += 5;
        time = 800 + offset;

        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey[300],
              child: ShimmeringObject(),
              period: Duration(milliseconds: time),
            ));
      },
    );
  }
}
