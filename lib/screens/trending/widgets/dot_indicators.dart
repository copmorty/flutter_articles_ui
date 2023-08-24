import 'package:flutter/material.dart';
import 'package:flutter_articles_ui/shared/colors.dart';

class DotIndicators extends StatelessWidget {
  final int dotLength;
  final double currentIndex;

  const DotIndicators({
    super.key,
    required this.dotLength,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dotLength,
        (index) => Icon(
          index == currentIndex.round() ? Icons.circle : Icons.circle_outlined,
          color: blackColorOp060,
          size: 8,
        ),
      ),
    );
  }
}
