import 'package:flutter_articles_ui/shared/data/models/article.dart';

const _descriptionText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...';

const List<Article> articles = [
  Article(
    id: '1',
    title: 'Shooting Stars',
    description: _descriptionText,
    image: 'assets/images/article_image_1.png',
    postTime: '4 hour ago',
    reads: '45k read',
    fans: '11k fan',
  ),
  Article(
    id: '2',
    title: 'Peak Perspectives',
    description: _descriptionText,
    image: 'assets/images/article_image_2.png',
    postTime: '3 hour ago',
    reads: '13k read',
    fans: '6.2k fan',
  ),
  Article(
    id: '3',
    title: 'Wild Expeditions',
    description: _descriptionText,
    image: 'assets/images/article_image_3.png',
    postTime: '2 hour ago',
    reads: '32k read',
    fans: '21k fan',
  ),
  Article(
    id: '4',
    title: 'Natural Symphony',
    description: _descriptionText,
    image: 'assets/images/article_image_4.png',
    postTime: '1 hour ago',
    reads: '10k read',
    fans: '1.2k fan',
  ),
];
