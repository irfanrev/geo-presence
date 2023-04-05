import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import '../controllers/new_class_controller.dart';

class NewClassView extends GetView<NewClassController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text('Tambah Jadwal Mengajar'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mata Pelajaran',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 6),
                      FormBuilderDropdown<String>(
                        name: 'mp',
                        initialValue: 'Matematika',
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
                          hintText: 'Pilih Mata Pelajaran',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.grey[500]),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                        items: controller.statusOptions
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
                  Text(
                    'Waktu Kelas Dimulai',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  FormBuilderDateTimePicker(
                    name: 'start',
                    validator: FormBuilderValidators.required(),
                    inputType: InputType.both,
                    initialValue: DateTime.now(),
                    initialDate: DateTime.now(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.date_range_rounded,
                        color: Colors.grey[500],
                      ),
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
                      hintText: 'Date and Time',
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
                        controller.postClassSchedule();
                      }
                    },
                    child: Center(
                      child: Obx(
                        () => controller.isLoading.value
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Tambah Jadwal',
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
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
