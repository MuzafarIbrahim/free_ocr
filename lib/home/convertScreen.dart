import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_ocr/constants/app_colors.dart';
import 'package:free_ocr/widgets/newHeader.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:hugeicons/hugeicons.dart';

class ConvertScreen extends StatefulWidget {
  const ConvertScreen({super.key});

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  String? _selectedFilePath;
  String? _selectedFileName;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    FileType.custom;
    ['png', 'pdf', 'docx', 'xlsx', 'doc'];

    if (result != null) {
      final path = result.files.single.path;
      final name = result.files.single.name;
      setState(() {
        _selectedFilePath = path;
        _selectedFileName = name;
      });
    }
  }

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
                "Convert Files",
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
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: _pickFile,
                child: Container(
                  width: double.infinity,
                  height: 150.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.primaryRed.withOpacity(0.5),
                      width: 1.w,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          HugeIcons.strokeRoundedFileAttachment,
                          color: AppColors.primaryRed,
                          size: 40.sp,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Upload a file from device",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 12.w,
                            //vertical: 4.h,
                          ),
                          child: Text(
                            "Note: PNG, PDF, DOCX, XLSX, or any other document.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              if (_selectedFilePath != null)
                Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryRed,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        _selectedFilePath != null
                            ? "Selected file: \"$_selectedFileName\""
                            : "No file selected",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.0,
                        ),
                        children: [
                          TextSpan(
                            text: "Instructions:",
                            style: TextStyle(
                              color: AppColors.primaryRed,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                              fontSize: 13.sp,
                            ),
                          ),
                          TextSpan(
                            text:
                                "\n-> We do not collect or store your personal data."
                                "\n-> We need gallery and file access only to process your selected images or documents."
                                "\n-> Your files stay on your device and are used solely for text extraction."
                                "\n-> We prioritize your privacy and security in every step of the process.",
                            style: TextStyle(
                              color: AppColors.black,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
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
