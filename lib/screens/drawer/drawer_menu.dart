import 'package:flutter/material.dart';
import 'package:flutter_articles_ui/shared/colors.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _DrawerMenuItem(iconData: Icons.home_outlined, title: 'NEWSFEED'),
        _DrawerMenuItem(iconData: Icons.notifications_outlined, title: 'NOTIFICATIONS'),
        _DrawerMenuItem(iconData: Icons.mail_outline, title: 'MESSAGES'),
        _DrawerMenuItem(iconData: Icons.camera_alt_outlined, title: 'PHOTOS'),
        _DrawerMenuItem(iconData: Icons.place_outlined, title: 'PLACES'),
      ],
    );
  }
}

class _DrawerMenuItem extends StatelessWidget {
  final IconData iconData;
  final String title;

  const _DrawerMenuItem({
    super.key,
    required this.iconData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Icon(
            iconData,
            color: whiteColorOp070,
          ),
          const SizedBox(width: 20),
          Text(title, style: const TextStyle(color: whiteColor, fontWeight: FontWeight.w600, fontSize: 12)),
        ],
      ),
    );
  }
}
