import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presence_app/app/model/class.dart';
import 'package:presence_app/app/modules/home/views/history_section/history_card.dart';
import 'package:presence_app/app/modules/home/views/home_section/class_card.dart';
import 'package:presence_app/app/utils/loading_overlay.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('users').doc(FirebaseAuth.instance.currentUser!.email).collection('history')
                .get(),
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
                      return HistoryCard(snap: data);
                    });
              }
            }),
      );

    
  }
}
