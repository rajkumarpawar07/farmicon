import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff387BC2),
      ),
      child: Row(
        children: [
          Container(
            width: 65,
            height: 60,
            padding:
                const EdgeInsets.only(left: 10.0, right: 5, top: 5, bottom: 5),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: const Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/img_1.png'))),
          ),
          Flexible(
            child: Text('Travel',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}
