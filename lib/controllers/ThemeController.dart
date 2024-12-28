import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;

  @override
  void onInit() async {
    super.onInit();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode.value = prefs.getBool('isDark') ?? false;
  }

  void toggleTheme() async {
    _isDarkMode.value = !_isDarkMode.value;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', _isDarkMode.value);
  }
}
