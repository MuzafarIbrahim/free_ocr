import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_ocr/constants/app_colors.dart';

class CustomHeader extends StatelessWidget {
  final VoidCallback? onProfileTap;

  const CustomHeader({super.key, this.onProfileTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(color: AppColors.background),
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

          GestureDetector(
            onTap: onProfileTap,
            child: Icon(
              CupertinoIcons.profile_circled,
              color: AppColors.primaryRed,
              size: 25.sp,
            ),
          ),
        ],
      ),
    );
  }
}
