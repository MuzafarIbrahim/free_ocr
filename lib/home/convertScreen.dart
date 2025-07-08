import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_ocr/constants/app_colors.dart';
import 'package:free_ocr/widgets/newHeader.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:hugeicons/hugeicons.dart';

class ConvertScreen extends StatelessWidget {
  const ConvertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        screenName: '',
        onBack: Get.back,
        onMore: () => print("More Options Coming Soon!!"),
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            children: [
              Icon(
                HugeIcons.strokeRoundedArrowDataTransferHorizontal,
                color: AppColors.primaryRed,
                size: 60.sp,
              ),
              SizedBox(height: 8.h),
              Text(
                "Scan/Upload Image",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "You can turn files into new formats you can share, edit, compress, or transform. Once converted, you can organize, optimize, merge, and automate anything you need.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black.withOpacity(0.5),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
