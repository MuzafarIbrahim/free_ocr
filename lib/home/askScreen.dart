import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_ocr/constants/app_colors.dart';
import 'package:free_ocr/widgets/newHeader.dart';
import 'package:get/route_manager.dart';

class AskScreen extends StatelessWidget {
  const AskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        screenName: 'Ask AI',
        onBack: Get.back,
        onMore: () {
          Get.toNamed('/aboutUs');
        },
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(children: [
            ],
          ),
        ),
      ),
    );
  }
}
