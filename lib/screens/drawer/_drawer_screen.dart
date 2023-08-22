import 'package:flutter/material.dart';
import 'package:flutter_articles_ui/screens/drawer/drawer_menu.dart';
import 'package:flutter_articles_ui/screens/drawer/drawer_profile.dart';
import 'package:flutter_articles_ui/shared/colors.dart';
import 'package:flutter_articles_ui/shared/sizes.dart';

class DrawerScreen extends StatelessWidget {
  final void Function() hideDrawer;

  const DrawerScreen(this.hideDrawer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding, vertical: 70),
      color: blackishColor,
      child: const Stack(
        children: [
          Align(alignment: Alignment.center, child: DrawerMenu()),
          Align(alignment: Alignment.bottomCenter, child: DrawerProfile())
        ],
      ),
    );
  }
}
