import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekitchen/component/color.dart';
import 'package:jekitchen/controllers/dashboard_controller.dart';
import 'package:jekitchen/pages/home_page.dart';
import 'package:jekitchen/pages/profile_page.dart';
import 'package:jekitchen/pages/notification_page.dart';

class Dashboardpage extends StatelessWidget {
  const Dashboardpage({super.key});

  @override
  Widget build(BuildContext context) {
    final Dashboardcontroller dashboardController = Get.put(Dashboardcontroller());

    final List<Widget> menus = [
      HomePage(),
      NotificationPage(),
      ProfilePage(),
    ];

    return Obx(() {
      return Scaffold(
        body: menus[dashboardController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dashboardController.selectedIndex.value,
          onTap: (index) {
            dashboardController.selectedIndex.value = index;
          },
          backgroundColor: AppColors.primary, 
          selectedItemColor: AppColors.secondary,
          unselectedItemColor: Colors.black54,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
