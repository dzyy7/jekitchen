import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekitchen/Dashboard.dart';
import 'package:jekitchen/controllers/login_controller.dart';
import 'package:jekitchen/pages/profile_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Scaffold(
      body: Center(
        child:
          ElevatedButton(
          onPressed: () async {
            await loginController.loginwithgoogle();
            if (loginController.user.value != null) {
              Get.off(() => Dashboardpage());
            }
          },
          child: const Text("Login with Google"),
        ),

      ),
    );
  }
}
