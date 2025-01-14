import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jekitchen/pages/login_page.dart';
import 'package:jekitchen/pages/wishlist_page.dart';
import 'package:jekitchen/firebase_options.dart';
import 'package:jekitchen/api/firebase_api.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      home: const LoginPage(),
      routes: {
        '/notification': (context) => const WishlistPage(),
      },
    );
  }
}
