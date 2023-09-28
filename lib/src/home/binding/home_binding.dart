import 'package:ecommecerfrutas/src/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBiding extends Bindings{


  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(Homecontroller());
  }


  
}