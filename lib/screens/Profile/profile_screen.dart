import 'package:farmicon/screens/Profile/controller/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ProfileForm(),
      backgroundColor: const Color(0xFF212835),
    );
  }
}

class ProfileForm extends StatelessWidget {
  final controller = ProfileScreenController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: Center(
                    child: Hero(
                      tag: 'profilePic',
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.shade800,
                        child: CircleAvatar(
                          radius: 48,
                          backgroundColor: Colors.black,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: const Image(
                              image: NetworkImage(
                                  'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
            buildExpansionTile(
              'Personal Details',
              [
                buildTextField('Name', controller.nameController),
                buildTextField('Mobile Number', controller.mobileController),
                buildTextField('Email Address', controller.emailController),
                buildTextField('LinkedIn', controller.linkedInController),
              ],
              context,
            ),
            const SizedBox(height: 10),
            buildExpansionTile(
              'Company Details',
              [
                const CircleAvatar(
                  radius: 40,
                  child: Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xff865CD0),
                          child: CircleAvatar(
                            radius: 38,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Icon(
                          Iconsax.camera5,
                          color: Color(0xff865CD0),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                buildTextField(
                    'Company Name', controller.companyNameController),
                buildTextField('Designation', controller.designationController),
                buildTextField('Description', controller.descriptionController),
                buildTextField(
                    'LinkedIn', controller.companyLinkedInController),
                buildTextField('Website', controller.websiteController),
                buildTextField('Address', controller.addressController),
              ],
              context,
            ),
            const SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.saveProfile();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff865CD0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    child: const Text('Save Changes'),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Discard Changes',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildExpansionTile(
      String title, List<Widget> children, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF212835),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xff865CD0),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          iconColor: const Color(0xff865CD0),
          collapsedIconColor: const Color(0xff865CD0),
          children: children,
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white, fontSize: 16),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: const Color(0xFF212835),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade600),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xff865CD0),
            ),
          ),
        ),
      ),
    );
  }
}
