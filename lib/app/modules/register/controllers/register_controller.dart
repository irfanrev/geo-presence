import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/routes/app_pages.dart';

import '../../../controller/auth_controller.dart';

class RegisterController extends GetxController {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> formKeyTeacher = GlobalKey<FormBuilderState>();

  TextEditingController emailC = TextEditingController();
  TextEditingController passC= TextEditingController();
  TextEditingController fullnameC= TextEditingController();
  TextEditingController nisC= TextEditingController();

  TextEditingController temailC = TextEditingController();
  TextEditingController tpassC= TextEditingController();
  TextEditingController tfullnameC= TextEditingController();
  TextEditingController tnisC= TextEditingController();

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
  List<String> genderOptions = [
    'Laki-laki',
    'Perempuan',
  ];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future registerStudent() async {
    try {
      isLoading.value = true;
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: emailC.text,
          password: passC.text);

      await _firebaseFirestore.collection('users').doc(emailC.text).set({
        "name": fullnameC.text,
        "nis": nisC.text,
        "email": emailC.text,
        "uid": cred.user!.uid,
        "userClass": formKey.currentState!.value['class'],
        "isTeacher": false,
        "gender": formKey.currentState!.value['gender'],
      });
      isLoading.value = false;
      Get.snackbar('Success', 'Register Berhasil!', backgroundColor: Colors.green, colorText: Colors.white);
      Get.offAllNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showError('Error', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showError('Error', 'The account already exists for that email.');
      }

    } catch (e) {
      Get.snackbar('Error', 'Some error occurred');
    }
  }


  Future registerTeacher() async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: temailC.text,
          password: tpassC.text);

      await _firebaseFirestore.collection('users').doc(temailC.text).set({
        "name": tfullnameC.text,
        "nis": tnisC.text,
        "email": temailC.text,
        "uid": cred.user!.uid,
        "userClass": 'Teacher',
        "isTeacher": true,
        "gender": '',
      });

      Get.snackbar('Success', 'Register Berhasil!', backgroundColor: Colors.green, colorText: Colors.white);
      Get.offAllNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showError('Error', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showError('Error', 'The account already exists for that email.');
      }

    } catch (e) {
      Get.snackbar('Error', 'Some error occurred');
    }
  }
}
