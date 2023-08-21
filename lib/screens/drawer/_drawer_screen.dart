import 'package:flutter/material.dart';
import 'package:flutter_articles_ui/shared/colors.dart';

class DrawerScreen extends StatelessWidget {
  final void Function() hideDrawer;

  const DrawerScreen(this.hideDrawer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: blackishColor,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ],
      ),
    );
  }
}
