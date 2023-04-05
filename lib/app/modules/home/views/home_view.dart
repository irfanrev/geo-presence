import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presence_app/app/modules/home/views/history_section/history_section.dart';
import 'package:presence_app/app/modules/home/views/home_section/home_section.dart';
import 'package:presence_app/app/modules/home/views/profile_section/profile_section.dart';
import 'package:presence_app/app/routes/app_pages.dart';

import '../../../utils/loading_overlay.dart';
import '../controllers/home_controller.dart';
import 'home_section/class_card.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    String classID = controller.isUser.value;
    return DefaultTabController(
      length: 3, // number of tabs
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.blue[700],
            title: Container(
              margin: EdgeInsets.only(top: 20),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.username.value,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                    ),
                    Text(
                      controller.nis.value,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Obx(
                () => Visibility(
                  visible: controller.isUser.value == 'Teacher' ? true : false,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.TEACHER);
                      },
                      icon: Icon(
                        Icons.school_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Home',
                ),
                Tab(
                  text: 'History',
                ),
                Tab(
                  text: 'Profile',
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(150.0),
        ),
        body: TabBarView(
          children: [
            // widgets for the first tab
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(16.0),
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('schedule')
                        .where('className', isEqualTo: controller.isUser.value)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoadingOverlay();
                      }
                      if ((snapshot.data as dynamic).docs.length == 0) {
                        return Center(
                          child: Text('Kosong!'),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: (snapshot.data as dynamic).docs.length,
                            itemBuilder: (context, index) {
                              var data =
                                  (snapshot.data! as dynamic).docs[index];
                              return ClassCard(snap: data);
                            });
                      }
                    }),
              ),
            ),
            // widgets for the second tab
            HistorySection(),
            ProfileSection(),
          ],
        ),
      ),
    );
  }
}
