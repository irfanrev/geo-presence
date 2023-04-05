import 'package:get/get.dart';

import '../controllers/teacher_controller.dart';

class TeacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherController>(
      () => TeacherController(),
    );
  }
}
