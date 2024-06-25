import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:farmicon/Utils/colors.dart';
import 'package:farmicon/screens/home/explore_screen.dart';
import 'package:farmicon/screens/network/network_screen.dart';
import 'package:farmicon/screens/scan_code_screen.dart';
import 'package:farmicon/widgets/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int selectedPos = 0;

  double bottomNavBarHeight = 70;

  List<Widget> screens = [
    const ExploreScreen(),
    const ScanCodeScreen(),
    const NetworkScreen(),
  ];

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.explore,
      "Explore",
      appColors.primaryColor,
      circleStrokeColor: Colors.white,
      labelStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    TabItem(
      Icons.qr_code_scanner_rounded,
      "Scan Code",
      appColors.primaryColor,
      circleStrokeColor: Colors.white,
      labelStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    TabItem(
      Icons.gamepad,
      "Network",
      appColors.primaryColor,
      circleStrokeColor: Colors.white,
      labelStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
            child: bodyContainer(),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              // heightFactor: 7.0,
              child: Container(child: bottomNav()))
        ],
      ),
    );
  }

  Widget bodyContainer() {
    return screens[selectedPos];
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      circleSize: 60,
      barHeight: bottomNavBarHeight,
      normalIconColor: Colors.white,
      circleStrokeWidth: 2,
      iconsSize: 24,
      // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
      barBackgroundColor: Color(0xff2F3A4B),

      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.white, blurRadius: 2.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
