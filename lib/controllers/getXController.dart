import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var userName = ''.obs;
  var userEmail = ''.obs;
  var age = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void setUserData({
    required String newName,
    required String newEmail,
    required String newAge,
  }) {
    userName.value = newName;
    userEmail.value = newEmail;
    age.value = newAge;
  }

  Future<void> saveUserData(String name, String email, String age) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', name);
    await prefs.setString('user_email', email);
    await prefs.setString('user_age', age);
    await prefs.setBool('is_first_time', false); // Mark as not first time

    // Update the observable variables
    setUserData(newName: name, newEmail: email, newAge: age);
  }

  // Load user data from SharedPreferences
  Future<void> loadUserData() async {
    final userData = await getUserData();
    if (userData != null) {
      userName.value = userData['name'] ?? '';
      userEmail.value = userData['email'] ?? '';
      age.value = userData['age'] ?? '';
    }
  }

  //to load user data
  Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('user_name')) {
      return {
        'name': prefs.getString('user_name'),
        'email': prefs.getString('user_email'),
        'age': prefs.getString('user_age'),
      };
    }
    return null;
  }

  //method to check if its first time login
  Future<bool> isFirstTimer() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_first_time') ?? true;
  }
}
