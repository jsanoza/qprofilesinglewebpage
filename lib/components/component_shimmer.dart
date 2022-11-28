import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ComponentShimmer extends StatelessWidget {
  const ComponentShimmer({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final width;
  final height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
