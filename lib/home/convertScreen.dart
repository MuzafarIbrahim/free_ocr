import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_ocr/constants/app_colors.dart';
import 'package:free_ocr/constants/conversionEndpoints.dart';
import 'package:free_ocr/widgets/newHeader.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:hugeicons/hugeicons.dart';
import 'package:url_launcher/url_launcher.dart';

class ConvertScreen extends StatefulWidget {
  const ConvertScreen({super.key});

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  String? _selectedFilePath;
  String? _selectedFileName;
  String? selectedValue;
  String? selectedLabel;
  File? selectedFile;
  bool isLoading = false;
  String? selectedEndpoint;
  String? downloadUrl;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final path = result.files.single.path;
      final name = result.files.single.name;
      setState(() {
        _selectedFilePath = path;
        _selectedFileName = name;
        selectedFile = File(path!);
      });
    }
  }

  final String baseUrl = "http://192.168.100.6:3000";
  Future<void> convertFile() async {
    if (selectedFile == null || selectedEndpoint == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select file and format to convert.")),
      );
      return;
    }

    setState(() {
      isLoading = true;
      downloadUrl = null;
    });

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl$selectedEndpoint'),
      );

      request.files.add(
        await http.MultipartFile.fromPath('file', selectedFile!.path),
      );
      var response = await request.send();

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        final data = jsonDecode(respStr);

        setState(() {
          downloadUrl = '$baseUrl${data['downloadUrl']}';
        });

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Conversion Successful")));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Conversion Failed!!")));
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An Error ocurred, Please try again.")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        screenName: '',
        onBack: Get.back,
        onMore: () {
          Get.toNamed('/aboutUs');
        },
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: SingleChildScrollView(
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
                if (_selectedFilePath != null) ...[
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
                              ? "Selected file: $_selectedFileName"
                              : "No file selected",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 320.w,
                    height: 50.h,
                    child: DropdownButton<String>(
                      value: selectedEndpoint,
                      hint: Text("Please select a format to convert"),
                      isExpanded: true,
                      icon: Icon(
                        HugeIcons.strokeRoundedArrowDown01,
                        color: Colors.red,
                      ),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      dropdownColor: Colors.white,
                      underline: Container(height: 2, color: Colors.red),
                      items: conversionOptions.map((option) {
                        return DropdownMenuItem<String>(
                          value: option['endpoint'],
                          child: Text(option['label']!),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedEndpoint = value;

                          selectedLabel = conversionOptions.firstWhere(
                            (option) => option['endpoint'] == value,
                          )['label'];
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  ElevatedButton(
                    onPressed: isLoading ? null : convertFile,
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
                      "Convert File",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (isLoading)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: LinearProgressIndicator(
                        color: AppColors.primaryRed,
                        backgroundColor: AppColors.primaryRed.withOpacity(0.5),
                      ),
                    ),
                  if (downloadUrl != null) ...[
                    SizedBox(height: 10.h),
                    TextButton(
                      onPressed: () async {
                        final uri = Uri.parse(downloadUrl!);
                        await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      child: Text(
                        "Download Converted File.",

                        style: TextStyle(
                          color: AppColors.primaryRed,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryRed,
                        ),
                      ),
                    ),
                  ],
                ],
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
      ),
    );
  }
}
