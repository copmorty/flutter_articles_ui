import 'package:flutter/material.dart';
import 'package:flutter_articles_ui/shared/colors.dart';

class DrawerProfile extends StatelessWidget {
  const DrawerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          foregroundImage: AssetImage('assets/images/profile_pic_1.png'),
          radius: 30,
        ),
        SizedBox(width: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jacob G. Reed',
              style: TextStyle(color: whiteColor, fontWeight: FontWeight.w700),
            ),
            Text(
              '37k followers',
              style: TextStyle(color: whiteColor),
            )
          ],
        )
      ],
    );
  }
}
