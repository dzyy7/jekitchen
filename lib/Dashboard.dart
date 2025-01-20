import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
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
              icon: Icon(Icons.home_outlined),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}