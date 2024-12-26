import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:khaliq_bus/controllers/NavigationController.dart';
import 'package:khaliq_bus/firebase_options.dart';
import 'package:get/get.dart';
import 'package:khaliq_bus/screens/NearbyPage.dart';
import 'screens/AboutusPage.dart';
import 'screens/FavouritesPage.dart';
import 'screens/ProfilePage.dart';
import 'screens/SearchPage.dart';
import 'screens/HomePage.dart';
import 'screens/LoginPage.dart';
import 'screens/WelcomePage.dart';

Future<void> main() async{
  //Controllers
  Get.put(NavigationController());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Khaliq Bus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      //Check if user is logged in 
      home: FirebaseAuth.instance.currentUser != null ? const HomePage() : const WelcomePage(),
      getPages: [
        GetPage(name: '/welcome', page: () => const WelcomePage(), transition: Transition.noTransition),
        GetPage(name: '/home', page: () => const HomePage(), transition: Transition.noTransition),
        GetPage(name: '/login', page: () => const LoginPage(), transition: Transition.rightToLeft),
        GetPage(name: '/profile', page: () => const ProfilePage()),
        GetPage(name: '/favourites', page: () => const FavouritesPage()),
        GetPage(name: '/search', page: () => const SearchPage(), transition: Transition.noTransition),
        GetPage(name: '/about', page: () => const AboutusPage(), transition: Transition.noTransition),
        GetPage(name: '/nearby', page: () => const NearbyPage(), transition: Transition.noTransition),
      ],
    );
  }
}
