import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presence_app/app/model/class.dart';
import 'package:presence_app/app/modules/home/controllers/home_controller.dart';
import 'package:presence_app/app/modules/home/views/home_section/class_card.dart';
import 'package:presence_app/app/utils/loading_overlay.dart';

class HomeSection extends StatelessWidget {
  final clasId;
  const HomeSection({Key? key, required this.clasId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('schedule').where('className', isEqualTo: 'XII IPA 1')
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
                      return ClassCard(snap: data);
                    });
              }
            }),
      );

    
  }
}
