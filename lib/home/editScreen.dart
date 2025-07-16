import 'package:flutter/material.dart';
import 'package:free_ocr/constants/app_colors.dart';
import 'package:free_ocr/widgets/newHeader.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        screenName: 'Edit',
        onBack: Get.back,
        onMore: () {
          Get.toNamed('/aboutUs');
        },
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(child: Column(children: [
          ],
        )),
    );
  }
}
