import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/modules/login/views/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Get.off(LoginView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  )),
                const SizedBox(
                  height: 20,
                ),
              Text('Absensi Online', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontSize: 24,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
