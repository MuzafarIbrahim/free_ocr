import 'package:flutter/material.dart';
import 'package:free_ocr/constants/app_colors.dart';
import 'package:free_ocr/widgets/newHeader.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomHeader(
        screenName: 'About Us',
        onBack: Get.back,
        onMore: () {
          Get.toNamed('/aboutUs');
        },
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFFE55050),
                  child: Text(
                    "M",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  "Muzafar Ibrahim",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE55050),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  "Software Engineer & Flutter Developer",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "About Me",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFE55050),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "I am a passionate software engineer specializing in building modern mobile applications using Flutter. "
                "I love solving problems and bringing ideas to life with clean, scalable code.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 24),
              Text(
                "Contact",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFE55050),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.email, color: Color(0xFFE55050)),
                  SizedBox(width: 8),
                  Text(
                    "muzafaribrahim@example.com",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.phone, color: Color(0xFFE55050)),
                  SizedBox(width: 8),
                  Text("+92-300-1234567", style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 24),
              Text(
                "Connect",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFE55050),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.link, color: Color(0xFFE55050)),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () async {
                      const url = "https://github.com/muzafaribrahim";
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: Text(
                      "GitHub",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.link, color: Color(0xFFE55050)),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () async {
                      const url = "https://linkedin.com/in/muzafaribrahim";
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: Text(
                      "LinkedIn",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
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
