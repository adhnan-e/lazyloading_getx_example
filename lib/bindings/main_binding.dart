import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../controller/main_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}