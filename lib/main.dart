import 'package:camera/camera.dart';
import 'package:farmicon/Utils/Theme/theme.dart';
import 'package:farmicon/bottom_naviagtion_bar.dart';
import 'package:farmicon/custom_bottom_nav_bar.dart';
import 'package:farmicon/firebase_options.dart';
import 'package:farmicon/nav_bottom.dart';
import 'package:farmicon/new_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

late List<CameraDescription> cameras;

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme.appThemeData,
      // home: const Directionality(
      //     textDirection: TextDirection.ltr, child: NavBar()),
      // home: const CustomNavBar(),
      // home: NewNavBar(),
      home: BottomNavigationBarScreen(),
    );
  }
}
