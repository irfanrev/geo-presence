import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/modules/register/controllers/register_controller.dart';

class StudentSection extends StatelessWidget {
  final RegisterController controller;
  const StudentSection({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: controller.formKey,
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
                controller: controller.fullnameC,
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
                  hintText: 'Nama Lengkap',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              const SizedBox(height: 22),
              Text(
                'NIS',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 6,
              ),
              TextField(
                controller: controller.nisC,
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
                  hintText: 'Nomor Induk Siswa',
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
                controller: controller.emailC,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kelas',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 6),
                  FormBuilderDropdown<String>(
                    name: 'class',
                    initialValue: 'X IPA 1',
                    validator: FormBuilderValidators.required(),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none, //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Colors.blue), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // suffix: GestureDetector(
                      //   onTap: () {
                      //     controller.formKey.currentState!.fields['gender']
                      //         ?.reset();
                      //   },
                      //   child: Icon(Icons.close),
                      // ),
                      hintText: 'Pilih Kelas',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: Colors.grey[500]),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    items: controller.classOptions
                        .map((status) => DropdownMenuItem(
                              alignment: AlignmentDirectional.centerStart,
                              value: status,
                              child: Text(
                                status,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Colors.grey[500],
                                    ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jenis Kelamin',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 6),
                  FormBuilderDropdown<String>(
                    name: 'gender',
                    initialValue: 'Laki-laki',
                    validator: FormBuilderValidators.required(),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none, //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Colors.blue), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // suffix: GestureDetector(
                      //   onTap: () {
                      //     controller.formKey.currentState!.fields['gender']
                      //         ?.reset();
                      //   },
                      //   child: Icon(Icons.close),
                      // ),
                      hintText: 'Pilih Jenis Kelamin',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: Colors.grey[500]),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    items: controller.genderOptions
                        .map((status) => DropdownMenuItem(
                              alignment: AlignmentDirectional.centerStart,
                              value: status,
                              child: Text(
                                status,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Colors.grey[500],
                                    ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
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
                controller: controller.passC,
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
                  if (controller.formKey.currentState!.validate()) {
                    controller.formKey.currentState!.save();
                    controller.registerStudent();
                  }
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
            ],
          ),
        ),
      ),
    );
  }
}
