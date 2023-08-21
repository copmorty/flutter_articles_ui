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

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController(initialScrollOffset: double.maxFinite);
  bool _drawerIsOpen = false;
  late double _screenWidth;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToDrawer() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
    );
    setState(() {
      _drawerIsOpen = true;
    });
  }

  void _scrollToTrending() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 1000),
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
      child: SafeArea(
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SizedBox(width: _screenWidth * 0.75, child: DrawerScreen(_scrollToTrending)),
                SizedBox(width: _screenWidth, child: TrendingScreen(_scrollToDrawer)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: screenHorizontalPadding),
              child: IconButton(
                onPressed: _drawerIsOpen ? _scrollToTrending : _scrollToDrawer,
                icon: Icon(
                  _drawerIsOpen ? Icons.close : Icons.menu,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
