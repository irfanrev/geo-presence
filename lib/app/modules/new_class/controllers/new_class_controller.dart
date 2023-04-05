import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/model/class.dart';
import 'package:presence_app/app/routes/app_pages.dart';
import 'package:uuid/uuid.dart';

class NewClassController extends GetxController {
  TextEditingController titleC = TextEditingController();
  TextEditingController teacherC = TextEditingController();
  TextEditingController classNameC = TextEditingController();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  var username;
  var uid;

  RxBool isLoading = false.obs;

  List<String> classOptions = [
    'X IPA 1',
    'X IPA 2',
    'X IPA 3',
    'X IPS 1',
    'X IPS 2',
    'XI IPA 1',
    'XI IPA 2',
    'XI IPA 3',
    'XI IPS 1',
    'XI IPS 2',
    'XII IPA 1',
    'XII IPA 2',
    'XII IPA 3',
    'XII IPS 1',
    'XII IPS 2',
  ];

  List<String> statusOptions = [
    'Fisika',
    'Biologi',
    'Kimia',
    'Matematika',
    'Geografi',
    'Sejarah',
    'Ekonomi',
    'Sosiologi',
    'Bahasa Inggris',
    'Seni Budaya',
    'Pendidikan Jasmani, Olah Raga, dan Kesehatan',
    'Prakarya dan Kewirausahaan',
    'Muatan Lokal',
  ];

  @override
  void onInit() {
    getUsersData();
    super.onInit();
  }


  Future getUsersData() async {
    User currentUser = auth.currentUser!;

    DocumentSnapshot userData =
        await _firestore.collection('users').doc(currentUser.email).get();
    username = userData['name'];
    uid = userData['uid'];
  }

  Future<void> postClassSchedule() async {
    try {
      isLoading.value = true;
      String conId = const Uuid().v1();
      Class classData = Class(
        classId: conId,
        teacher: username,
        title: formKey.currentState!.value['mp'],
        uuid: uid,
        className: formKey.currentState!.value['class'],
        classTime: formKey.currentState!.value['start'],
        email: auth.currentUser!.email,
      );
      await _firestore.collection('schedule').doc(conId).set(classData.toJson());
      showNotif('Success', 'Jadwal kelas berhasil!');
      isLoading.value = false;
      Get.offAllNamed(Routes.TEACHER);
    } catch (e) {
      print(e);
    }
  }
}

showError(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: Colors.red,
    colorText: Colors.white,
  );
}


void showNotif(String title, String message) {
  Get.snackbar(title, message.toString(),
      backgroundColor: Colors.green, colorText: Colors.white);
}
