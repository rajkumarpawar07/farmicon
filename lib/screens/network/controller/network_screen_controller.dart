import 'package:farmicon/data/persons_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NetworkScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static NetworkScreenController get instance => Get.find();

  /// variable
  RxInt selectedType = 0.obs;
  late final SlidableController controller = SlidableController(this);
  final searchController = TextEditingController();
  RxList<Person> filteredPeople = <Person>[].obs;
  RxInt byScanSelected = 0.obs;

  void changeSelectedType(int index) {
    selectedType.value = index;
  }

  void changeByScanSelected(int index) {
    byScanSelected.value = index;
    print('byScanSelected: $byScanSelected');
  }

  @override
  void onInit() {
    print('NetworkScreenController onInit');
    super.onInit();
    filteredPeople.value = people;
    searchController.addListener(() {
      filteredPeople.value = people
          .where((person) => person.name
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }
}
