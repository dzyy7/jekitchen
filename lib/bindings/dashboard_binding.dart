import 'package:get/get.dart';
import 'package:jekitchen/controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.put(Dashboardcontroller());
    
  }
}