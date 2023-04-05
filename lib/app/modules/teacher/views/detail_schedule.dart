import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:presence_app/app/utils/loading_overlay.dart';

class DetailSchedule extends StatelessWidget {
  const DetailSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text('Detail Kelas'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('schedule')
                  .doc(Get.arguments.classId)
                  .collection('presence')
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingOverlay();
                }
                if ((snapshot.data as dynamic).docs.length == 0) {
                  return Center(
                    child: Text('Kosong!'),
                  );
                } else {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Text(
                          '${(snapshot.data as dynamic).docs.length} Siswa Sudah Absen',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        child: ListView.builder(
                            itemCount: (snapshot.data as dynamic).docs.length,
                            itemBuilder: (context, index) {
                              var data =
                                  (snapshot.data! as dynamic).docs[index];
                              var hour = DateFormat('HH:mm').format(
                                  DateTime.parse(data['presence_at'])
                                      .toLocal());
                              return Container(
                                margin: EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    data['name'],
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  subtitle: Text(
                                    data['nis'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Jam Absen: $hour',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        data['status'],
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: data['status'] == 'Terlambat'
                                                ? Colors.red
                                                : Colors.green),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ))
                    ],
                  );
                }
              }),
        ));
  }
}
