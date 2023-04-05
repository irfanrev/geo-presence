import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeC = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextAvatar(
                text: homeC.username.toString(),
                size: 130,
                numberLetters: 2,
                fontSize: 48,
                fontWeight: FontWeight.w700,
                shape: Shape.Circular,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            homeC.username.toString(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
            textAlign: TextAlign.center,
          ),
          Text(
            '${homeC.gender == '' ? 'NIP: ' : 'NIS: '} ${homeC.nis.toString()}',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.email_rounded, size: 32),
                    title: Text('Email'),
                    subtitle: Text(
                      homeC.email.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: homeC.gender != '' ,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.school, size: 32),
                      title: Text('Kelas'),
                      subtitle: Text(
                        homeC.userClass.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: homeC.gender != '',
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.person, size: 32),
                      title: Text('Jenis Kelamain'),
                      subtitle: Text(
                        homeC.gender.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(16),
              primary: Colors.amber[600],
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: () {
              homeC.logout();
            },
            child: Text(
              'logout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
