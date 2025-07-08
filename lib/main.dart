import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_ocr/controllers/getXController.dart';
import 'package:free_ocr/routes/pages.dart';
import 'package:free_ocr/splash/splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  Get.put(UserController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "FreeOCR",
          theme: ThemeData(fontFamily: 'Helvetica Neue'),
          initialRoute: '/splash',
          getPages: appPages,
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
