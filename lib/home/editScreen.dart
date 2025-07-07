import 'package:flutter/material.dart';
import 'package:free_ocr/constants/app_colors.dart';
import 'package:free_ocr/widgets/backButton.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            HeaderTwo(
              screenName: 'Edit',
              onBack: Get.back,
              onMore: () => print("More Options Coming Soon!!"),
            ),
            Center(child: Text("Edit Screen")),
          ],
        ),
      ),
    );
  }
}
