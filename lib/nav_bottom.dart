import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:farmicon/Utils/colors.dart';
import 'package:farmicon/screens/home/explore_screen.dart';
import 'package:farmicon/screens/network/network_screen.dart';
import 'package:farmicon/screens/scan_code_screen.dart';
import 'package:farmicon/widgets/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      ExploreScreen(),
      const ScanCodeScreen(),
      const NetworkScreen(),
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: Colors.black,
              showLabel: true,
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              shadowElevation: 5,
              kBottomRadius: 28.0,

              // notchShader: const SweepGradient(
              //   startAngle: 0,
              //   endAngle: 3.18 / 2,
              //   colors: [Colors.red, Colors.green, Colors.orange],
              //   tileMode: TileMode.mirror,
              // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
              notchColor: appColors.primaryColor,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              showShadow: false,
              durationInMilliSeconds: 300,

              itemLabelStyle: const TextStyle(fontSize: 12),

              elevation: 10,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    size: 24,
                    Icons.explore,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.explore,
                    color: Colors.white,
                  ),
                  itemLabelWidget: Text(
                    'Explore',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                BottomBarItem(
                  inActiveItem:
                      Icon(Icons.qr_code_scanner, color: Colors.white),
                  activeItem: Icon(
                    Icons.qr_code_scanner,
                    color: Colors.white,
                  ),
                  itemLabelWidget: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    'Scan Code',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    size: 20,
                    // Icons.near_me,
                    MyFlutterApp.network_wired,
                    color: Colors.white,
                  ),
                  activeItem: Center(
                    child: Icon(
                      size: 20,
                      // Icons.near_me,
                      MyFlutterApp.network_wired,
                      color: Colors.white,
                    ),
                  ),
                  itemLabelWidget: Text(
                    'Network',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}
