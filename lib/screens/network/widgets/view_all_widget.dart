import 'package:farmicon/Utils/colors.dart';
import 'package:farmicon/Utils/image_strings.dart';
import 'package:farmicon/data/persons_data.dart';
import 'package:farmicon/screens/network/controller/network_screen_controller.dart';
import 'package:farmicon/widgets/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ViewAllWidget extends StatelessWidget {
  const ViewAllWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NetworkScreenController.instance;
    return Column(
      children: [
        Container(
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
                          color: Colors.white, fontWeight: FontWeight.w500)),
                  Text('Femto',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
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
                              image: AssetImage('assets/images/user1.png')),
                        )),
                  ],
                )),
            Positioned(
              top: 10,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SvgPicture.asset('assets/images/Group.svg')),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
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
        ),
        Obx(
          () => ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.filteredPeople.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
              itemBuilder: (context, index) {
                Person person = controller.filteredPeople[index];
                return Slidable(
                  key: ValueKey(index),
                  // controller: controller,
                  endActionPane: ActionPane(
                    extentRatio: 0.3,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        flex: 3,
                        onPressed: (context) {},
                        icon: Icons.close_sharp,
                        foregroundColor: appColors.networkScreenBackgroundColor,
                        backgroundColor: appColors.networkScreenBackgroundColor,
                        padding: const EdgeInsets.all(50),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      SlidableAction(
                        flex: 6,
                        onPressed: (context) {
                          controller.filteredPeople.removeAt(index);
                        },
                        spacing: 0,
                        icon: MyFlutterApp.cancel_circled_outline,
                        foregroundColor: Colors.grey,
                        backgroundColor: const Color(0xff2F3A4B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Transform.translate(
                        offset: const Offset(20, 0),
                        child: Container(
                          height: 120,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFF353C4A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Container(
                        height: 120,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.darken),
                            image:
                                const AssetImage(appImages.ConatinerBackImage),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(children: [
                          Positioned(
                            top: 10,
                            left: 105,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(person.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                Row(
                                  children: [
                                    Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: const Image(
                                              fit: BoxFit.cover,
                                              image:
                                                  AssetImage(appImages.logo)),
                                        )),
                                    const SizedBox(width: 5),
                                    Text(person.companyName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const SizedBox(height: 5),
                                const Text('View Details',
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
                              top: 15,
                              left: 0,
                              child: Column(
                                children: [
                                  Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: const Image(
                                            fit: BoxFit.cover,
                                            image: AssetImage(appImages.user2)),
                                      )),
                                ],
                              )),
                          Positioned(
                            top: 10,
                            right: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: SvgPicture.asset(
                                        height: 20,
                                        'assets/images/Group 21.svg')),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 0,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 7),
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
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
