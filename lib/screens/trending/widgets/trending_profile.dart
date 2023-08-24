import 'package:flutter/material.dart';
import 'package:flutter_articles_ui/shared/sizes.dart';

class TrendingProfile extends StatelessWidget {
  const TrendingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              CircleAvatar(
                foregroundImage: AssetImage('assets/images/profile_pic_2.png'),
                radius: 20,
              ),
              SizedBox(width: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sophia Reynolds',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  Text(
                    '37k followers',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward, size: 30))
        ],
      ),
    );
  }
}
