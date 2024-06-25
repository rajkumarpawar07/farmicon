import 'package:farmicon/screens/home/explore_screen.dart';
import 'package:farmicon/screens/network/network_screen.dart';
import 'package:farmicon/screens/scan_code_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewNavBar extends StatefulWidget {
  const NewNavBar({super.key});

  @override
  State<NewNavBar> createState() => _NewNavBarState();
}

class _NewNavBarState extends State<NewNavBar> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    ExploreScreen(),
    Center(
      child: Text('remove'),
    ),
    Center(child: Text('Search')),
    NetworkScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: Stack(
        children: [
          CustomBottomNavigationBar(
            onItemSelected: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
          ),
          CenterButton(
            onPressed: () {
              setState(() {
                _pageIndex = 1;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onItemSelected;

  CustomBottomNavigationBar({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomNavClipper(),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.purple,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () => onItemSelected(0),
            ),
            IconButton(
              icon: Icon(Icons.favorite, color: Colors.white),
              onPressed: () => onItemSelected(1),
            ),
            SizedBox(width: 40), // The space for the center button
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () => onItemSelected(2),
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () => onItemSelected(3),
            ),
          ],
        ),
      ),
    );
  }
}

class CenterButton extends StatelessWidget {
  final VoidCallback onPressed;

  CenterButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 35,
      left: MediaQuery.of(context).size.width / 2 - 30,
      child: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: onPressed,
      ),
    );
  }
}

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.35, 0);
    path.quadraticBezierTo(
      size.width * 0.4,
      0,
      size.width * 0.4,
      20,
    );
    path.arcToPoint(
      Offset(size.width * 0.6, 20),
      radius: Radius.circular(30),
      clockwise: false,
    );
    path.quadraticBezierTo(
      size.width * 0.6,
      0,
      size.width * 0.65,
      0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
