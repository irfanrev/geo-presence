import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presence_app/app/modules/register/views/student_section.dart';
import 'package:presence_app/app/modules/register/views/teacher_section.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text(
            'Register',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'Siswa',
              ),
              Tab(
                text: 'Pengajar',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // widgets for the first tab
            StudentSection(
              controller: controller,
            ),
            // widgets for the second tab
            TeacherSection(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}
