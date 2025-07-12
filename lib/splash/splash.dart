import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_ocr/constants/app_colors.dart';
import 'package:free_ocr/controllers/animationController.dart';
import 'package:free_ocr/controllers/getXController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final SplashAnimationController _splashAnimation;

  @override
  void initState() {
    super.initState();
    _splashAnimation = SplashAnimationController(this);

    Future.delayed(const Duration(seconds: 3), () async {
      final userController = Get.find<UserController>();
      final isFirstTime = await userController.isFirstTimer();

      if (isFirstTime) {
        Get.offNamed('/info'); // Go to info screen for first time users
      } else {
        Get.offNamed('/home'); // Go directly to home for returning users
      }
    });
  }

  @override
  void dispose() {
    _splashAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 260.h),
              SlideTransition(
                position: _splashAnimation.animation,
                child: FadeTransition(
                  opacity: _splashAnimation.opacityAnimation,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                      children: [
                        TextSpan(
                          text: "Free",
                          style: TextStyle(color: AppColors.textDark),
                        ),
                        TextSpan(
                          text: "OCR",
                          style: TextStyle(color: AppColors.primaryRed),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                textAlign: TextAlign.center,
                "Made with ❤️\nMuzafar Ibrahim\nVersion 1.0.0",
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
