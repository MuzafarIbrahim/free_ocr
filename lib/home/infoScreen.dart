import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_ocr/constants/app_colors.dart';
import 'package:free_ocr/controllers/getXController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen>
    with SingleTickerProviderStateMixin {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();

  bool _isChecked = false;

  //method to save user data to Sharedpreferences
  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', _nameController.text.trim());
    await prefs.setString('user_email', _emailController.text.trim());
    await prefs.setString('user_age', _ageController.text.trim());
    await prefs.setBool('is_first_time', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 30.sp,
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
              SizedBox(height: 60.h),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
                child: TextField(
                  controller: _nameController,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Muzafar Ibrahim",
                    floatingLabelStyle: TextStyle(color: AppColors.primaryRed),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryRed),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: AppColors.primaryRed),
                    ),
                    prefixIcon: Icon(HugeIcons.strokeRoundedUser02),
                    prefixIconColor: AppColors.primaryRed,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "abc@xyz.com",
                    floatingLabelStyle: TextStyle(color: AppColors.primaryRed),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryRed),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: AppColors.primaryRed),
                    ),
                    prefixIcon: Icon(HugeIcons.strokeRoundedMail01),
                    prefixIconColor: AppColors.primaryRed,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
                child: TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.datetime,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    hintText: "DD/MM/YYYY",
                    floatingLabelStyle: TextStyle(color: AppColors.primaryRed),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryRed),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: AppColors.primaryRed),
                    ),
                    prefixIcon: Icon(HugeIcons.strokeRoundedCalendar03),
                    prefixIconColor: AppColors.primaryRed,
                  ),
                ),
              ),
              CheckboxListTile(
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
                activeColor: AppColors.primaryRed,
                checkColor: AppColors.white,
                controlAffinity: ListTileControlAffinity.leading,
                title: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.0,
                    ),
                    children: [
                      TextSpan(
                        text: "I agree to the ",
                        style: TextStyle(color: AppColors.textDark),
                      ),
                      TextSpan(
                        text: "Terms & Conditions",
                        style: TextStyle(
                          color: AppColors.primaryRed,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_isChecked && _nameController.text.trim().isNotEmpty) {
                      //save user data to sharedpreferences
                      await _saveUserData();

                      //show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.primaryRed,
                          content: Text(
                            "Welcome ${_nameController.text}, Thanks for accepting our terms",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                      Get.find<UserController>().setUserData(
                        newName: _nameController.text.trim(),
                        newEmail: _emailController.text.trim(),
                        newAge: _ageController.text.trim(),
                      );
                      //get to home and remove this screen from the stack
                      Get.offNamed('/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.primaryRed,
                          content: Text(
                            _nameController.text.trim().isEmpty
                                ? "Please enter your name & accept our terms"
                                : "Dear ${_nameController.text} please accept our terms.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryRed,
                    foregroundColor: AppColors.white,
                    minimumSize: Size(300.w, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    "Lets Go!!",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
