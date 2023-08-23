import 'package:flutter/material.dart';
import 'package:flutter_articles_ui/shared/colors.dart';
import 'package:flutter_articles_ui/shared/sizes.dart';

class TrendingAppBar extends StatelessWidget {
  const TrendingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: blackishColor,
      padding: const EdgeInsets.only(left: screenHorizontalPadding, right: screenHorizontalPadding, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.menu,
              color: transparentColor,
            ),
          ),
          const Text(
            'Trending Article',
            style: TextStyle(color: whiteColor, fontWeight: FontWeight.w600),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
