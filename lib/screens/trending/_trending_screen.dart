import 'package:flutter/material.dart';
import 'package:flutter_articles_ui/screens/trending/trending_app_bar.dart';
import 'package:flutter_articles_ui/screens/trending/trending_body.dart';
import 'package:flutter_articles_ui/shared/colors.dart';

class TrendingScreen extends StatelessWidget {
  final Animation<double> scaleAnimation;
  final Animation<double> fadeAnimation;
  final bool drawerIsOpen;

  const TrendingScreen({
    super.key,
    required this.scaleAnimation,
    required this.fadeAnimation,
    required this.drawerIsOpen,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: drawerIsOpen,
      child: Container(
        color: blackishColor,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TrendingAppBar(),
              Expanded(
                child: Container(
                  color: whiteColor,
                  child: TrendingBody(fadeAnimation),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
