import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_ocr/constants/app_colors.dart';
import 'package:free_ocr/controllers/getXController.dart';
import 'package:free_ocr/widgets/featureTile.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        toolbarHeight: 50.h,
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 26.sp,
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
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Obx(
                () => RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                    children: [
                      TextSpan(
                        text: "Hi, ",
                        style: TextStyle(color: AppColors.textDark),
                      ),
                      TextSpan(
                        text: userController.userName.value,
                        style: TextStyle(color: AppColors.primaryRed),
                      ),
                      TextSpan(
                        text: "\nHow can I help\nyou today?",
                        style: TextStyle(color: AppColors.textDark),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 40.h),
              FeatureTile(
                onTap: () => Get.toNamed('/scanner'),
                icon: HugeIcons.strokeRoundedScanImage,
                title: "Scan",
                desc: "Document, ID cards, Images, and much more!!",
              ),
              SizedBox(height: 10.h),
              FeatureTile(
                onTap: () => Get.toNamed('/convertor'),
                icon: HugeIcons.strokeRoundedArrowDataTransferHorizontal,
                title: "Convert",
                desc: "PDF, DOCX, JPG, PNG, PPT, XLSX, DOC, etc.",
              ),

              SizedBox(height: 20.h),
              Divider(
                color: AppColors.primaryRed,
                radius: BorderRadius.circular(20.r),
                thickness: 3.0,
                indent: 15.w,
                endIndent: 15.w,
              ),
              SizedBox(height: 8.h),
              Text(
                "Recents",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
