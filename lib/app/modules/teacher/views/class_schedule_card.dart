import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:presence_app/app/model/class.dart';
import 'package:presence_app/app/modules/teacher/controllers/teacher_controller.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/routes/app_pages.dart';

class ClassScheduleCard extends StatelessWidget {
  final snap;
  final TeacherController controller;
  const ClassScheduleCard(
      {Key? key, required this.snap, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('d MMMM y')
        .format(DateTime.parse(snap['classTime']).toLocal());
    var hour =
        DateFormat('HH:mm').format(DateTime.parse(snap['classTime']).toLocal());
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.DETAIL_SCHEDULE,
            arguments: Class(
              classId: snap['classId'],
              teacher: snap['teacher'],
              title: snap['title'],
              classTime: DateTime.parse(snap['classTime']),
              uuid: snap['uuid'],
              className: snap['className'],
              email: snap['email'],
            ));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 16),
          width: MediaQuery.of(context).size.width,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: -30,
                bottom: -40,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.2,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      snap['title'],
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.amber[600],
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(snap['teacher'].toString(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith()),
                    Text(hour,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith()),
                  ],
                ),
              ),
              Positioned(
                right: -30,
                bottom: -60,
                child: Container(
                  width: 150,
                  height: 150,
                  child: Text(
                    snap['className'],
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Colors.amber[600],
                        ),
                  ),
                ),
              ),
              Positioned(
                right: -15,
                top: -20,
                child: Container(
                  width: 100,
                  height: 100,
                  child: IconButton(
                    onPressed: () {
                      controller.deleteSchedule(snap['classId']);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
