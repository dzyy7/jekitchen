import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekitchen/controllers/login_controller.dart';

class ProfilePage extends StatelessWidget {
  final LoginController loginController =  Get.put(LoginController());
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = loginController.user.value;
    return Scaffold(
      body: user == null
          ? const Center(child: Text("No user logged in"))
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.photoURL ?? ''),
                ),
                const SizedBox(height: 20),
                Text(
                  "Name: ${user.displayName}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  "Email: ${user.email}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
    );
  }
}