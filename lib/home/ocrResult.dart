import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_ocr/constants/app_colors.dart';
import 'package:free_ocr/widgets/newHeader.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class OCRResult extends StatefulWidget {
  final File imageFile;

  const OCRResult({super.key, required this.imageFile});

  @override
  State<OCRResult> createState() => _OCRResultState();
}

class _OCRResultState extends State<OCRResult> {
  String _ocrResult = "";
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _performOCR();
  }

  Future<void> _performOCR() async {
    final String _serverUrl = "http://192.168.100.6:3000/api/ocr-upload";
    var request = http.MultipartRequest('POST', Uri.parse(_serverUrl));
    request.files.add(
      await http.MultipartFile.fromPath('image', widget.imageFile.path),
    );

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        setState(() {
          _ocrResult = jsonResponse['TextResult'] ?? "No Text found";
        });
      } else {
        setState(() {
          _ocrResult = "Error: ${response.statusCode} \n ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _ocrResult = "Upload failed: $e";
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        screenName: 'OCR Result',
        onBack: Get.back,
        onMore: () {
          Get.toNamed('/aboutUs');
        },
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _loading
                    ? Container(
                        height: 500.h,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : Container(
                        width: double.infinity,
                        height: 300,
                        child: Image.file(widget.imageFile),
                      ),
                SizedBox(height: 16.h),
                Text(
                  _ocrResult,
                  style: TextStyle(
                    color: AppColors.descColor.withOpacity(0.7),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                if (_loading == false)
                  ElevatedButton.icon(
                    icon: Icon(Icons.copy),
                    label: Text("Copy to Clipboard"),
                    onPressed: () {
                      if (_ocrResult.isNotEmpty) {
                        Clipboard.setData(ClipboardData(text: _ocrResult));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Copied to clipboard")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryRed,
                      foregroundColor: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
