import 'package:flutter/material.dart';
import 'package:flutter_articles_ui/screens/trending/trending_app_bar.dart';
import 'package:flutter_articles_ui/shared/colors.dart';

class TrendingScreen extends StatelessWidget {
  final void Function() showDrawer;

  const TrendingScreen(this.showDrawer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: whiteColor,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrendingAppBar(),
          ],
        ),
      );
  }
}
