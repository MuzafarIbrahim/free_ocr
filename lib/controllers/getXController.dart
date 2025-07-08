import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {
  var userName = ''.obs;
  var userEmail = ''.obs;
  var age = ''.obs;

  void setUserData({
    required String newName,
    required String newEmail,
    required String newAge,
  }) {
    userName.value = newName;
    userEmail.value = newEmail;
    age.value = newAge;
  }
}
