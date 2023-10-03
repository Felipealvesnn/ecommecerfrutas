import 'package:ecommecerfrutas/src/pages/base/controller/navigation_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut(() => NavigationController());


  }
}