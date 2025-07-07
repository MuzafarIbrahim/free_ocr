import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_ocr/constants/app_colors.dart';
import 'package:free_ocr/widgets/customHeader.dart';
import 'package:free_ocr/widgets/featureTile.dart';
import 'package:get/route_manager.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(onProfileTap: () => print("Profile tapped")),
              SizedBox(height: 40.h),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                  children: [
                    TextSpan(
                      text: "Hi,",
                      style: TextStyle(color: AppColors.textDark),
                    ),
                    TextSpan(
                      text: "Muzafar!!",
                      style: TextStyle(color: AppColors.primaryRed),
                    ),
                    TextSpan(
                      text: "\nHow can I help\nyou today?",
                      style: TextStyle(color: AppColors.textDark),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FeatureTile(
                    onTap: () => Get.toNamed('/scanner'),
                    icon: HugeIcons.strokeRoundedScanImage,
                    title: "Scan",
                    desc: "Document, ID cards, Images, and much more!!",
                  ),
                  FeatureTile(
                    onTap: () => Get.toNamed('/editor'),
                    icon: HugeIcons.strokeRoundedNoteEdit,
                    title: "Edit",
                    desc: "Sign, Add text, Mark, Delete text, highlight etc.",
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FeatureTile(
                    onTap: () => Get.toNamed('/convertor'),
                    icon: HugeIcons.strokeRoundedArrowDataTransferHorizontal,
                    title: "Convert",
                    desc: "PDF, DOCX, JPG, PNG, PPT, XLSX, DOC, etc.",
                  ),

                  FeatureTile(
                    onTap: () => Get.toNamed('/askAI'),
                    icon: HugeIcons.strokeRoundedMagicWand01,
                    title: "Ask AI",
                    desc: "Summarise, Finish Writing, Improve, and more!!",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
