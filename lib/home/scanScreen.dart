import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_ocr/constants/app_colors.dart';
import 'package:free_ocr/widgets/newHeader.dart';
import 'package:free_ocr/home/ocrResult.dart';
import 'package:get/route_manager.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickMedia(requestFullMetadata: true);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  Future<void> uploadImage(File imageFile) async {
    setState(() {});
  }

  Future<void> captureImage() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _imageFile = File(photo.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        screenName: _imageFile != null ? 'Image Uploaded' : '',
        onBack: Get.back,
        onMore: () => print("More Options Coming Soon!!"),
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_imageFile == null) ...[
                  Icon(
                    HugeIcons.strokeRoundedScanImage,
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
                    "This lets you scan or upload an image and extract text from it. You can copy full or a part of text and paste it anywhere.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.black.withOpacity(0.5),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: captureImage,
                    child: Container(
                      width: double.infinity,
                      height: 100.h,
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
                              HugeIcons.strokeRoundedCamera02,
                              color: AppColors.primaryRed,
                              size: 40.sp,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "Scan Document",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "OR",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: pickImageFromGallery,
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
                              HugeIcons.strokeRoundedUpload04,
                              color: AppColors.primaryRed,
                              size: 40.sp,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "Upload Image From Gallery",
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
                                "Note: The image size should not be more than 10 MB.\nOnly PNG, JPG, JPEG, HEIC formats are allowed.",
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
                  Row(
                    children: [
                      Text(
                        "Instructions: ",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "-> We do not collect or store your personal data."
                          "\n-> We need gallery and file access only to process your selected images or documents."
                          "\n-> Your files stay on your device and are used solely for text extraction."
                          "\n-> We prioritize your privacy and security in every step of the process.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  Container(
                    width: double.infinity,
                    //height: 500,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.black.withOpacity(0.5),
                        width: 2.5,
                      ),
                    ),
                    child: Image.file(_imageFile!, fit: BoxFit.contain),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          pickImageFromGallery;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.background,
                          foregroundColor: AppColors.primaryRed,
                          minimumSize: Size(160.w, 30.h),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: AppColors.primaryRed.withOpacity(0.9),
                              width: 1.w,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: Text(
                          "Change Image",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(
                            () => OCRResult(imageFile: _imageFile!),
                            transition: Transition.fadeIn,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryRed,
                          foregroundColor: AppColors.white,
                          minimumSize: Size(160.w, 30.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: Text(
                          "Extract Text",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
