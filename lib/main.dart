import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekitchen/Dashboard.dart';
import 'package:jekitchen/api/firebase_api.dart';
import 'package:jekitchen/firebase_options.dart';
import 'package:jekitchen/pages/login_page.dart';
import 'package:jekitchen/pages/notification_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications(); // Inisialisasi notifikasi

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginPage(),
      getPages: [
        GetPage(name: '/notification', page: () => const NotificationPage()),
      ],
      // Pastikan navigasi ke halaman lain tetap mengikuti struktur BottomNavigation
    );
  }
}
