import 'package:farmicon/Utils/colors.dart';
import 'package:farmicon/Utils/image_strings.dart';
import 'package:farmicon/data/persons_data.dart';
import 'package:farmicon/screens/network/controller/network_screen_controller.dart';
import 'package:farmicon/screens/network/widgets/recently_visited_widget.dart';
import 'package:farmicon/screens/network/widgets/saved_widget.dart';
import 'package:farmicon/screens/network/widgets/view_all_widget.dart';
import 'package:farmicon/widgets/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({super.key});

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NetworkScreenController());
    return Scaffold(
        backgroundColor: appColors.networkScreenBackgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kToolbarHeight,
              ),
              const Text('Search for you saved companies here.',
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFA995CE),
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 3),
              Row(
                children: [
                  Flexible(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(children: [
                          Icon(Icons.search,
                              color: Colors.black.withOpacity(0.6)),
                          const SizedBox(width: 16),
                          Flexible(
                            child: TextField(
                              controller: controller.searchController,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(0),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ])),
                  ),
                  Container(
                    padding: const EdgeInsets.all(13),
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset('assets/images/filter-lines.svg'),
                  )
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: Obx(
                  () => ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.changeSelectedType(0);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: controller.selectedType.value == 0
                                  ? appColors.primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text('View All',
                                  style: TextStyle(
                                      color: controller.selectedType.value == 0
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            controller.changeSelectedType(1);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: controller.selectedType.value == 1
                                  ? appColors.primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text('Recently Visited',
                                  style: TextStyle(
                                      color: controller.selectedType.value == 1
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            controller.changeSelectedType(2);
                          },
                          child: Obx(
                            () => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: controller.selectedType.value == 2
                                    ? appColors.primaryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Saved',
                                    style: TextStyle(
                                        color:
                                            controller.selectedType.value == 2
                                                ? Colors.white
                                                : Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.selectedType.value == 0) {
                  return const ViewAllWidget();
                } else if (controller.selectedType.value == 1) {
                  return RecentlyVisitedWidget();
                } else if (controller.selectedType.value == 2) {
                  return const SavedWidget();
                } else {
                  return const Text('Default Widget');
                }
              }),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
