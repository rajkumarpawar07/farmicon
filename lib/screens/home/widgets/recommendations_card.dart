import 'package:farmicon/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class RecommendationsCard extends StatelessWidget {
  const RecommendationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: appColors.homeScreenBackgroundColor,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: const Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/img.png'))),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'GreenTech Conference',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'September 5, 2023',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        const Icon(
                          size: 15,
                          Iconsax.location,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text('Bangalore, India',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 10,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 30,
                    color: Color(0xff2C2637),
                    child: Center(
                      child: Text('Rs. 200',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  )
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
