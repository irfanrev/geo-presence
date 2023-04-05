import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presence_app/app/modules/teacher/views/class_schedule_card.dart';
import 'package:presence_app/app/routes/app_pages.dart';
import 'package:presence_app/app/utils/loading_overlay.dart';

import '../controllers/teacher_controller.dart';

class TeacherView extends GetView<TeacherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Dashboard Pengajar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('schedule').where('email', isEqualTo: controller.auth.currentUser!.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {  
                return LoadingOverlay();
              }
              if ((snapshot.data as dynamic).docs.length == 0) {
                return Center(
                  child:  Text('Kosong!'),
                );
              } else {
                return ListView.builder(
                    itemCount: (snapshot.data as dynamic).docs.length,
                    itemBuilder: (context, index) {
                      var data = (snapshot.data! as dynamic).docs[index];
                      return ClassScheduleCard(snap: data, controller: controller,);
                    });
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.toNamed(Routes.NEW_CLASS);
      }, child: Icon(Icons.add),),
    );
  }
}
