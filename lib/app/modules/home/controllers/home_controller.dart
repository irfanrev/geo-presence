import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:presence_app/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  GetStorage box = GetStorage();

  RxString username = ''.obs;
  RxString nis = ''.obs;
  var email;
  var gender;
  var userClass;
  RxString isUser = ''.obs;
  var isTeacher = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    getUsersData();
    super.onInit();
  }

  Future getUsersData() async {
    User currentUser = auth.currentUser!;

    DocumentSnapshot userData =
        await _firestore.collection('users').doc(currentUser.email).get();
    username.value = userData['name'].toString();
    nis.value = userData['nis'].toString();
    userClass = userData['userClass'];
    isUser.value = userData['userClass'];
    isTeacher.value = userData['isTeacher'];
    email = userData['email'];
    gender = userData['gender'];
  }


  void logout() async {
    await box.remove('token');
    Get.offAllNamed(Routes.LOGIN);
  }
}
