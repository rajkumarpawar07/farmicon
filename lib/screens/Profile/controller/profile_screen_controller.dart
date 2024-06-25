import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  static ProfileScreenController get instance => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final linkedInController = TextEditingController();

  final companyNameController = TextEditingController();
  final designationController = TextEditingController();
  final descriptionController = TextEditingController();
  final companyLinkedInController = TextEditingController();
  final websiteController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void saveProfile() async {
    try {
      await _firestore.collection('profiles').add({
        'name': nameController.text,
        'mobile': mobileController.text,
        'email': emailController.text,
        'linkedIn': linkedInController.text,
        'companyName': companyNameController.text,
        'designation': designationController.text,
        'description': descriptionController.text,
        'companyLinkedIn': companyLinkedInController.text,
        'website': websiteController.text,
        'address': addressController.text,
      });
      Get.snackbar("Success", "Profile saved successfully",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
