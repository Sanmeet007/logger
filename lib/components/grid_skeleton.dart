import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class GridSkeleton extends StatelessWidget {
  final Color color;
  final double height;
  final int count;
  final int crossAxisCount;
  final double childAspectRatio;
  final double gridGap;
  final EdgeInsets? margin;
  final bool useTitle;

  const GridSkeleton({
    super.key,
    this.color = const Color.fromARGB(255, 240, 230, 255),
    this.height = 200.0,
    this.count = 4,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1,
    this.gridGap = 10.0,
    this.margin,
    this.useTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (useTitle)
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
          if (useTitle)
            const SizedBox(
              height: 15.0,
            ),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: gridGap,
            mainAxisSpacing: gridGap,
            shrinkWrap: true,
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            children: List.filled(count, 0, growable: false).map((_) {
              return Shimmer.fromColors(
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
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
