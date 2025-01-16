import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekitchen/component/color.dart';
import 'package:jekitchen/component/font.dart';
import 'package:jekitchen/controllers/login_controller.dart';

class ProfilePage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = loginController.user.value;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(user?.photoURL ?? ''),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  '${user?.displayName}',
                  style: AppTextStyles.headline1(22),
                ),
              ),
              SizedBox(height: 4),
              Center(
                child: Text(
                  '${user?.email}',
                  style: AppTextStyles.bodyText(14),
                ),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildProfileInfoItem(Icons.work, 'Unemployee'),
                        _buildProfileInfoItem(Icons.location_on, 'Indonesia'),
                        _buildProfileInfoItem(Icons.cake, '16 years'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '#ReadyForWork',
                      style: AppTextStyles.bodyText(14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              ListTile(
                leading: Icon(Icons.settings, color: AppColors.primary),
                title: Text('Settings', style: AppTextStyles.bodyText(16)),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: AppColors.primary),
                onTap: () {},
              ),
              ListTile(
                  leading: Icon(Icons.logout, color: AppColors.primary),
                  title: Text('Log Out', style: AppTextStyles.bodyText(16)),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: AppColors.primary),
                  onTap: () {
                    Get.offAllNamed('/');
                    Get.snackbar('Ke Login Page', '',
                        snackPosition: SnackPosition.TOP);
                  }),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.secondary,
    );
  }

  Widget _buildProfileInfoItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 30),
        const SizedBox(height: 8),
        Text(label, style: AppTextStyles.bodyText(14)),
      ],
    );
  }
}
