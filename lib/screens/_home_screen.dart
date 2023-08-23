import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_articles_ui/screens/drawer/_drawer_screen.dart';
import 'package:flutter_articles_ui/screens/trending/_trending_screen.dart';
import 'package:flutter_articles_ui/shared/colors.dart';
import 'package:flutter_articles_ui/shared/custom_system_ui_overlay_style.dart';
import 'package:flutter_articles_ui/shared/sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final _scrollController = ScrollController(initialScrollOffset: double.maxFinite);
  bool _drawerIsOpen = false;
  late double _screenWidth;
  late AnimationController _primaryAnimationController;
  late AnimationController _secondaryAnimationController;
  late Animation<double> _paddingAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });

    _primaryAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      reverseDuration: const Duration(milliseconds: 600),
    );

    _secondaryAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _paddingAnimation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(parent: _primaryAnimationController, curve: Curves.ease, reverseCurve: Curves.easeInOutCubic),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _secondaryAnimationController, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _primaryAnimationController.dispose();
    _secondaryAnimationController.dispose();
    super.dispose();
  }

  void _scrollToDrawer() {
    _primaryAnimationController.forward();
    _secondaryAnimationController.forward();

    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 700),
      curve: Curves.fastOutSlowIn,
    );

    setState(() {
      _drawerIsOpen = true;
    });
  }

  void _scrollToTrending() async {
    _secondaryAnimationController.reverse();
    await Future.delayed(_secondaryAnimationController.duration! * 0.3);
    _primaryAnimationController.reverse();

    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 600),
      curve: Curves.fastOutSlowIn,
    );

    setState(() {
      _drawerIsOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: CustomSystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: blackishColor,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    width: _screenWidth * 0.75,
                    child: DrawerScreen(_slideAnimation),
                  ),
                  SizedBox(
                    width: _screenWidth,
                    child: AnimatedBuilder(
                      animation: _paddingAnimation,
                      builder: (context, child) => TrendingScreen(_paddingAnimation.value),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
                child: IconButton(
                  onPressed: _drawerIsOpen ? _scrollToTrending : _scrollToDrawer,
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _primaryAnimationController,
                    color: whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
