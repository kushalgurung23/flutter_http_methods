import 'package:get/get.dart';
import 'package:second_http_methods/controllers/home_screen_controller.dart';
import 'package:second_http_methods/repositories/user_repository.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository());
    Get.put(HomeScreenController());
  }
}
