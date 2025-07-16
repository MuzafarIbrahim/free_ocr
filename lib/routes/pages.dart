import 'package:free_ocr/home/askScreen.dart';
import 'package:free_ocr/home/convertScreen.dart';
import 'package:free_ocr/home/editScreen.dart';
import 'package:free_ocr/home/homeScreen.dart';
import 'package:free_ocr/home/aboutScreen.dart';
import 'package:free_ocr/home/infoScreen.dart';
import 'package:free_ocr/home/scanScreen.dart';
import 'package:free_ocr/splash/splash.dart';
import 'package:get/route_manager.dart';

final List<GetPage> appPages = [
  GetPage(
    name: '/splash',
    page: () => SplashScreen(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: '/home',
    page: () => HomeScreen(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: '/scanner',
    page: () => ScanScreen(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: '/editor',
    page: () => EditScreen(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: '/convertor',
    page: () => ConvertScreen(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: '/askAI',
    page: () => AskScreen(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: '/info',
    page: () => InfoScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/aboutUs',
    page: () => AboutUsScreen(),
    transition: Transition.fadeIn,
  ),
];
