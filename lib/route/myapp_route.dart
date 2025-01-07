
import 'package:get/get.dart';
import 'package:jekitchen/bindings/login_binding.dart';
import 'package:jekitchen/pages/login_page.dart';

class MyappRoute {
  //daftar konstanta untuk nama tampilanya
  static const login='/login';
}

class AppPage{
  //resgist all page and binding
  static final pages = [
    //call getX Method
    GetPage(name: MyappRoute.login, page:()=> LoginPage(),binding: LoginBinding()),
  ];
}