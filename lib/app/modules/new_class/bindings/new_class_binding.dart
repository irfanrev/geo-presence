import 'package:get/get.dart';

import '../controllers/new_class_controller.dart';

class NewClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewClassController>(
      () => NewClassController(),
    );
  }
}
