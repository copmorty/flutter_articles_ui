import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_articles_ui/shared/colors.dart';
import 'package:flutter_articles_ui/shared/data/models/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  final int index;
  final double page;
  static late double _cardOverlay;
  static const double _maxOverlay = 0.4;
  static late double _cardScale;
  static const double _minScale = 0.95;
  static const double _maxScale = 1.0;
  static const double _scaleDiff = _maxScale - _minScale;

  const ArticleCard({
    super.key,
    required this.article,
    required this.index,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    final pageInt = page.toInt();
    final pageFract = page % 1;

    if (index == pageInt) {
      _cardScale = _minScale + (1 - pageFract) * _scaleDiff;
      _cardOverlay = pageFract * _maxOverlay;
    } else if (index == pageInt + 2) {
      _cardScale = _minScale;
      _cardOverlay = _maxOverlay;
    } else {
      _cardScale = _minScale + pageFract * _scaleDiff;
      _cardOverlay = (1 - pageFract) * _maxOverlay;
    }

    return Transform.scale(
      scale: _cardScale,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [whiteColor, transparentColor],
                    ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height)),
                    blendMode: BlendMode.dstIn,
                    child: Image.asset(article.image, height: 50, width: double.infinity, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                    child: Container(color: transparentColor, height: 100, width: double.infinity),
                  ),
                ),
              ),
            ),
            FractionallySizedBox(
              heightFactor: 0.9,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(blackColorOp010, BlendMode.darken),
                        child: Image.asset(
                          article.image,
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                article.title,
                                style: const TextStyle(color: whiteColor, fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                article.postTime,
                                style: const TextStyle(color: whiteColor, fontSize: 10),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            article.description,
                            style: const TextStyle(color: whiteColor, fontSize: 10),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.circle_outlined, color: whiteColor, size: 10),
                              Text(article.reads, style: const TextStyle(color: whiteColor, fontSize: 10)),
                              Text(article.fans, style: const TextStyle(color: whiteColor, fontSize: 10)),
                              const SizedBox(height: 5),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  foregroundColor: whiteColor,
                                  padding: const EdgeInsets.symmetric(horizontal: 35),
                                ).copyWith(side: MaterialStateProperty.all(const BorderSide(color: whiteColor, width: 2))),
                                onPressed: () {},
                                child: const Text(
                                  'Read more',
                                  style: TextStyle(color: whiteColor, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                color: Colors.white.withOpacity(_cardOverlay),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
