import 'package:farmicon/Utils/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:farmicon/screens/network/controller/network_screen_controller.dart';

class RecentlyVisitedWidget extends StatelessWidget {
  RecentlyVisitedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NetworkScreenController.instance;
    return Obx(() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSegment("By Scan", 0, context),
              _buildSegment("By QR Code", 1, context),
            ],
          ),
          const SizedBox(height: 20),
          controller.byScanSelected.value == 0
              ? Container(
                  height: 130,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF403F3F),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(children: [
                    const Positioned(
                      top: 10,
                      left: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Radhey Shyam Maan',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                          Text('Femto',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.white,
                                size: 17,
                              ),
                              Text('Startup Mahakhumbh, Delhi',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text('View Details',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 10,
                        left: 0,
                        child: Column(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(appImages.logo)),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/user1.png')),
                                )),
                          ],
                        )),
                    Positioned(
                      top: 10,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          controller.changeSelectedType(2);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: SvgPicture.asset(
                                    'assets/images/Group.svg')),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                          decoration: BoxDecoration(
                            color: Color(0xFF865CD0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.download,
                            color: Colors.white,
                          )),
                    )
                  ]),
                )
              : Text(
                  'By QR Code',
                  style: TextStyle(color: Colors.white),
                ),
        ],
      );
    });
  }

  Widget _buildSegment(String text, int index, BuildContext context) {
    final controller = NetworkScreenController.instance;
    bool isSelected = controller.byScanSelected.value == index;

    return GestureDetector(
      onTap: () {
        controller.changeByScanSelected(index);
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        decoration: BoxDecoration(
            color: isSelected ? const Color(0xffD5C6EF) : Colors.white,
            border: isSelected
                ? const Border(
                    bottom: BorderSide(color: Color(0xff865CD0), width: 3),
                  )
                : null //865CD0
            ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? const Color(0xff865fff) : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
