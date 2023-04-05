import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presence_app/app/modules/home/views/home_view.dart';
import 'package:presence_app/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * 0.2,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Silahkan login menggunakan email dan password',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                    ),
                    const SizedBox(
                      height: 46,
                    ),
                    TextField(
                      controller: controller.emailC,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: controller.passC,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.emailC.text.isNotEmpty &&
                            controller.passC.text.isNotEmpty) {
                          controller.login();
                        }
                      },
                      child: Center(
                        child: Obx(
                          () => controller.isLoading.value
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.REGISTER);
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.amber[400]),
                            ))
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
