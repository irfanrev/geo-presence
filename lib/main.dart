import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:presence_app/app/modules/login/views/login_view.dart';
import 'package:presence_app/app/utils/splash_screen.dart';

import 'app/modules/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: box.hasData('token') ? Routes.HOME : Routes.LOGIN,
      getPages: AppPages.routes,
    );
  }
}
