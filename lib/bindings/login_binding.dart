import 'package:get/get.dart';
import 'package:jekitchen/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginController());
  }
}