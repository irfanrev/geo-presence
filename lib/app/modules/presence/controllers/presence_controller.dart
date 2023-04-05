import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:presence_app/app/utils/pick_image.dart';
import 'package:uuid/uuid.dart';
import 'package:geolocator/geolocator.dart';

import '../../../model/class.dart';
import '../../new_class/controllers/new_class_controller.dart';

class PresenceController extends GetxController {
  PresenceController({this.classID});
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Class classData = Get.arguments;
  Uint8List? file;
  var refId;

  var username;
  var className;
  var nis;
  var classID;

  var currentLong;
  var currentLat;

  RxString status = 'Belum Presensi'.obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getUsersData();
    determinePosition();
    checkPresence();
    super.onInit();
  }

  Future getUsersData() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot userData =
        await _firestore.collection('users').doc(currentUser.email).get();
    username = userData['name'];
    nis = userData['nis'];
    className = userData['userClass'];
  }

  Future<Position?> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future checkPresence() async {
    await _firestore
        .collection('schedule')
        .doc(classData.classId.toString())
        .collection('presence')
        .where('uid', isEqualTo: _auth.currentUser!.uid)
        .get()
        .then((value) => {
              if (value.docs.length > 0)
                {
                  Get.snackbar(
                      'Perhatian', 'Anda sudah melakukan presensi',
                      backgroundColor: Colors.green, colorText: Colors.white),
                  status.value = 'Sudah Presensi'
                }
              else
                {
                  Get.snackbar(
                      'Perhatian', 'Anda belum melakukan presensi',
                      backgroundColor: Colors.red, colorText: Colors.white)
                }
            });
  }
  

  void chooseCamera() async {
    Uint8List? source = await pickImage(ImageSource.camera);
    file = source;
    update();
  }

  Future<String> uploadImageToStorage(
      String childname, Uint8List? file, bool isPost) async {
    Reference ref =
        firebaseStorage.ref().child(childname).child(_auth.currentUser!.uid);

    if (isPost) {
      String id = Uuid().v1();
      ref = ref.child(id);
      refId = id;
    }

    UploadTask uploadTask = ref.putData(file!);

    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> getCurrentLocation() async {
    try {
      isLoading.value = true;
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      double latitude = position.latitude;
      double longitude = position.longitude;

      currentLat = latitude;
      currentLong = longitude;

      print('Latitude: $latitude, Longitude: $longitude');

      double schoolLatitude =
          -6.3267806; // Replace with the latitude of the school
      double schoolLongitude =
          107.3108589; // Replace with the longitude of the school
      double distanceInMeters = await Geolocator.distanceBetween(
          latitude, longitude, schoolLatitude, schoolLongitude);

      if (distanceInMeters < 1000) {
        print('You are within 1 kilometer of the school.');
        isLoading.value = false;
        if(status.value == 'Sudah Presensi'){
          Get.snackbar('Perhatian', 'Anda sudah melakukan presensi pada kelas ini', backgroundColor: Colors.green, colorText: Colors.white);
        } else {
          chooseCamera();
        }
      } else {
        Get.snackbar('Warning', 'Anda berada pada jarak lebih dari 1km dari sekolah', backgroundColor: Colors.red, colorText: Colors.white);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> onPresences(String classId, String title, String teacher,
      String classTime, String className) async {
    try {
      String photo = await uploadImageToStorage('preseces', file!, true);

      String id = const Uuid().v1();

      var dateCurrent =
          DateTime.parse(classTime).subtract(Duration(minutes: 30));
      var dateNow = DateTime.now();

      if (dateNow.isBefore(dateCurrent)) {
        Get.snackbar('Perhatian', 'Anda terlambat melakukan presensi',
            backgroundColor: Colors.red, colorText: Colors.white);
        await _firestore
            .collection('schedule')
            .doc(classId)
            .collection('presence')
            .doc(_auth.currentUser!.email)
            .set({
          "name": username,
          "nis": nis,
          "class": className,
          "uid": _auth.currentUser!.uid,
          "imageUrl": photo,
          "presence_at": DateTime.now().toString(),
          "status": "Terlambat",
          "latitude": currentLat.toString(),
          "longitude": currentLong.toString(),
        });

        await _firestore
            .collection('users')
            .doc(_auth.currentUser!.email)
            .collection('history')
            .doc(classId)
            .set({
          "name": username,
          "nis": nis,
          "class": className,
          "uid": _auth.currentUser!.uid,
          "teacher": teacher,
          "classTime": classTime,
          "title": title,
          "imageUrl": photo,
          "presence_at": DateTime.now().toString(),
          "status": "Terlambat",
          "latitude": currentLat.toString(),
          "longitude": currentLong.toString(),
        });
      } else {
        await _firestore
            .collection('schedule')
            .doc(classId)
            .collection('presence')
            .doc(_auth.currentUser!.email)
            .set({
          "name": username,
          "nis": nis,
          "class": className,
          "uid": _auth.currentUser!.uid,
          "imageUrl": photo,
          "presence_at": DateTime.now().toString(),
          "status": "Tepat Waktu",
          "latitude": currentLat.toString(),
          "longitude": currentLong.toString(),
        });

        await _firestore
            .collection('users')
            .doc(_auth.currentUser!.email)
            .collection('history')
            .doc(classId)
            .set({
          "name": username,
          "nis": nis,
          "class": className,
          "uid": _auth.currentUser!.uid,
          "teacher": teacher,
          "classTime": classTime,
          "title": title,
          "imageUrl": photo,
          "presence_at": DateTime.now().toString(),
          "status": "Tepat Waktu",
          "latitude": currentLat.toString(),
          "longitude": currentLong.toString(),
        });
      }

      Get.snackbar('Berhasil', 'Absensi Berhasil Dilakukan!',
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      print(e);
    }
  }
}
