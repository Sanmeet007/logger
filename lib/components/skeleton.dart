import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  final Color color;
  final double height;
  final EdgeInsets? margin;

  const Skeleton({
    super.key,
    this.color = const Color.fromARGB(255, 240, 230, 255),
    this.height = 200.0,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: color.withAlpha(155),
            highlightColor: color,
            enabled: true,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 20.0,
              width: MediaQuery.of(context).size.width / 2.5,
            ),
            // child: ,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Shimmer.fromColors(
            baseColor: color.withAlpha(155),
            highlightColor: color,
            enabled: true,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: height,
              width: double.infinity,
            ),
            // child: ,
          ),
        ],
      ),
    );
  }
}
