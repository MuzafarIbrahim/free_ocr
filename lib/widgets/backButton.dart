import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_ocr/constants/app_colors.dart';
import 'package:hugeicons/hugeicons.dart';

class HeaderTwo extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onMore;
  final String screenName;
  const HeaderTwo({
    super.key,
    this.onMore,
    this.onBack,
    required this.screenName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onBack,
            icon: Icon(
              HugeIcons.strokeRoundedArrowLeft03,
              size: 25.sp,
              color: AppColors.primaryRed,
            ),
          ),
          Text(
            screenName,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            onPressed: onMore,
            icon: Icon(
              HugeIcons.strokeRoundedMoreVerticalCircle01,
              size: 25.sp,
              color: AppColors.primaryRed,
            ),
          ),
        ],
      ),
    );
  }
}
