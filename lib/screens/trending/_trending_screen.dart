import 'package:flutter/material.dart';
import 'package:flutter_articles_ui/screens/trending/trending_app_bar.dart';
import 'package:flutter_articles_ui/screens/trending/trending_body.dart';
import 'package:flutter_articles_ui/shared/colors.dart';

class TrendingScreen extends StatelessWidget {
  final double verticalPadding;

  const TrendingScreen(this.verticalPadding, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: blackishColor,
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TrendingAppBar(),
          Expanded(
            child: Container(
              color: whiteColor,
              child: const TrendingBody(),
            ),
          ),
        ],
      ),
    );
  }
}
