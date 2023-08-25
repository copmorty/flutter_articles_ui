import 'package:flutter/material.dart';
import 'package:flutter_articles_ui/screens/trending/widgets/article_card.dart';
import 'package:flutter_articles_ui/screens/trending/widgets/dot_indicators.dart';
import 'package:flutter_articles_ui/screens/trending/widgets/trending_profile.dart';
import 'package:flutter_articles_ui/shared/data/data_source.dart';

class TrendingBody extends StatefulWidget {
  final Animation<double> fadeAnimation;

  const TrendingBody(this.fadeAnimation, {super.key});

  @override
  State<TrendingBody> createState() => _TrendingBodyState();
}

class _TrendingBodyState extends State<TrendingBody> {
  final _pageController = PageController(
    viewportFraction: 0.85,
  );
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_handlePageChange);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handlePageChange() {
    setState(() {
      _currentPage = _pageController.page!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: screenHeight * 0.06),
        Stack(
          children: [
            SizedBox(
              height: screenHeight * 0.58,
              child: PageView.builder(
                controller: _pageController,
                itemCount: articles.length,
                itemBuilder: (context, index) => ArticleCard(
                  article: articles[index],
                  index: index,
                  page: _currentPage,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: DotIndicators(dotLength: articles.length, currentIndex: _currentPage),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.06),
        FadeTransition(
          opacity: widget.fadeAnimation,
          child: const TrendingProfile(),
        ),
      ],
    );
  }
}
