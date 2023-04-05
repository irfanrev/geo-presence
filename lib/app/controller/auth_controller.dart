import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {

  
  
}


showError(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: Colors.red,
    colorText: Colors.white,
  );
}
