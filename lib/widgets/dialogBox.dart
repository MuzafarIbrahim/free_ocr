import 'package:flutter/material.dart';
import 'package:free_ocr/controllers/getXController.dart';
import 'package:get/get.dart';
// Adjust your path as needed

class DialogBox extends StatefulWidget {
  const DialogBox({Key? key}) : super(key: key);

  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: Colors.white,
      title: Text("Enter Your Information"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: "Age"),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_nameController.text.trim().isEmpty ||
                _emailController.text.trim().isEmpty ||
                _ageController.text.trim().isEmpty) {
              Get.snackbar(
                "Error",
                "Please fill all fields",
                snackPosition: SnackPosition.BOTTOM,
              );
              return;
            }

            Get.find<UserController>().setUserData(
              newName: _nameController.text.trim(),
              newEmail: _emailController.text.trim(),
              newAge: _ageController.text.trim(),
            );

            Get.back();
          },
          child: Text("Save"),
        ),
      ],
    );
  }
}
