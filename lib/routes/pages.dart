import 'package:free_ocr/home/homeScreen.dart';
import 'package:free_ocr/splash/splash.dart';
import 'package:get/route_manager.dart';

final List<GetPage> appPages = [
  GetPage(
    name: '/splash',
    page: () => SplashScreen(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: '/home',
    page: () => HomeScreen(),
    transition: Transition.rightToLeftWithFade,
  ),
];
