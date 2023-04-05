import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/modules/register/controllers/register_controller.dart';

class TeacherSection extends StatelessWidget {
  final RegisterController controller;
  const TeacherSection({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              controller: controller.tfullnameC,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusColor: Colors.grey[100],
                fillColor: Colors.grey[100],
                filled: true,
                hintText: 'Nama Lengkap Beserta Gelar',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            const SizedBox(height: 22),
            Text(
              'NIP/NO. Indentikasi Guru',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              controller: controller.tnisC,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusColor: Colors.grey[100],
                fillColor: Colors.grey[100],
                filled: true,
                hintText: 'Nomor Indentik / NIP',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            const SizedBox(height: 22),
            Text(
              'Email',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              controller: controller.temailC,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusColor: Colors.grey[100],
                fillColor: Colors.grey[100],
                filled: true,
                hintText: 'Masukan email',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            const SizedBox(height: 22),
            Text(
              'Password',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              controller: controller.tpassC,
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusColor: Colors.grey[100],
                fillColor: Colors.grey[100],
                filled: true,
                hintText: 'Masukan password',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                controller.registerTeacher();
              },
              child: Center(
                child: Obx(
                  () => controller.isLoading.value
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
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
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
