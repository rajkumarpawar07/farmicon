import 'package:farmicon/screens/home/explore_screen.dart';
import 'package:farmicon/screens/network/network_screen.dart';
import 'package:farmicon/screens/scan_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ExploreScreen(),
    Center(child: Text('Favorites')),
    Center(child: Text('Search')),
    NetworkScreen(),
    ScanCodeScreen() // Page for the central button
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        child: Stack(
          children: [
            // SizedBox(
            //   height: 90,
            //   width: MediaQuery.of(context).size.width,
            //   child: CustomPaint(
            //     painter: UShapePainter(),
            //     child: Container(
            //       color: Colors.red,
            //     ),
            //   ),
            // ),
            ClipPath(
              clipper: MyCurvedEdges(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 130,
                color: Colors.red,
                child: BottomAppBar(
                  color: Color(0xff2F3A4B),
                  shape: const CircularNotchedRectangle(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => _onItemTapped(0),
                            icon: Icon(
                              Icons.home,
                              color: _selectedIndex == 0
                                  ? Colors.white
                                  : Color(0xffA995CE),
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () => _onItemTapped(1),
                            icon: FaIcon(
                              FontAwesomeIcons.solidHeart,
                              color: _selectedIndex == 1
                                  ? Colors.white
                                  : Color(0xffA995CE),
                              size: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          IconButton(
                            onPressed: () => _onItemTapped(2),
                            icon: Icon(
                              Icons.search,
                              color: _selectedIndex == 2
                                  ? Colors.white
                                  : Color(0xffA995CE),
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () => _onItemTapped(3),
                            icon: Icon(
                              Icons.person,
                              color: _selectedIndex == 3
                                  ? Colors.white
                                  : Color(0xffA995CE),
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2.4,
              bottom: 35,
              child: GestureDetector(
                onTap: () => _onItemTapped(4),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Color(0xff2F3A4B), // Background color
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.2), // Shadow color
                    //     spreadRadius: 2, // Spread radius
                    //     blurRadius: 5, // Blur radius
                    //     offset: Offset(0, 3), // Offset in x and y
                    //   ),
                    // ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.qr_code_scanner, // Replace with the desired icon
                      color: Colors.white, // Icon color
                      size: 30, // Icon size
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 10);

    final firstCurve = Offset(size.width / 2.1, size.height / 1.1);
    final secondCurve = Offset(size.width, 10);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, secondCurve.dx, secondCurve.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class UShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.deepPurple, 5.0, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }
}
