import 'package:get/get.dart';
import 'package:khaliq_bus/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;

  //On init, when the app first loads, set the isDarkMode 
  // to be based on the shared preferences (`isDark`)
  @override
  void onInit() {
    super.onInit();
    _initializeTheme(); 
  }

  // This is to keep the onInit function synchronous apparently its good practise
  void _initializeTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode.value = prefs.getBool('isDark') ?? false; // if the shared preferences does not exist
  }


  //Toggle the state of isDarkMode
  void toggleTheme() async {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeTheme(_isDarkMode.value ? darkMode : lightMode);

    //Save the isDark to shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', _isDarkMode.value);
  }
}
