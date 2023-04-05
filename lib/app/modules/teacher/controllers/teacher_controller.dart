import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class TeacherController extends GetxController {
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;


  
  void deleteSchedule(String id) async {
    await _firestore.collection('schedule').doc(id).delete();
  }

}
