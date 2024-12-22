import 'package:get/get.dart';
import 'package:khaliq_bus/screens/FavouritesPage.dart';
import 'package:khaliq_bus/screens/NearbyPage.dart';
import 'package:khaliq_bus/screens/ProfilePage.dart';
import 'package:khaliq_bus/screens/SearchPage.dart';
import '../screens/HomePage.dart';

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomePage(), const SearchPage(), const FavouritesPage(), const NearbyPage(), const ProfilePage()];
}