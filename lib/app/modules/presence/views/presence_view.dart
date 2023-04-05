import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart' as latLng;

import 'package:get/get.dart';
import 'package:presence_app/app/model/class.dart';

import '../controllers/presence_controller.dart';

class PresenceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var date = DateFormat('d MMMM y').format(DateTime.now().toLocal());
    Class classData = Get.arguments;
    return GetBuilder<PresenceController>(
        init: PresenceController(classID: Get.arguments.toString()),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: SizedBox.expand(
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: FlutterMap(
                        options: MapOptions(
                          center: latLng.LatLng(-6.293992,107.3344862),
                          zoom: 18.0,
                        ),
                        layers: [
                          TileLayerOptions(
                            urlTemplate:
                                "https://api.mapbox.com/styles/v1/irfanrev/ckyy14nmg002i15p7dmad3zfk/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaXJmYW5yZXYiLCJhIjoiY2t5eHYzYnBoMG0wNjJ2bzJsdmVmYTJuciJ9.4B_V8Hbrff-1_045m2ULRA",
                            additionalOptions: {
                              'accessToken':
                                  'pk.eyJ1IjoiaXJmYW5yZXYiLCJhIjoiY2t5eHYzYnBoMG0wNjJ2bzJsdmVmYTJuciJ9.4B_V8Hbrff-1_045m2ULRA',
                              'id': 'mapbox.mapbox-streets-v8'
                            },
                            attributionBuilder: (_) {
                              return Text("© OpenStreetMap contributors");
                            },
                          ),
                          MarkerLayerOptions(
                            markers: [
                              Marker(
                                width: 80.0,
                                height: 80.0,
                                point: latLng.LatLng(-6.293992,107.3344862),
                                builder: (ctx) => Container(
                                    child: Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                  size: 40,
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                date,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'MAN 2 Karawang',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Obx(
                                () => Text(
                                  controller.status.value,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: controller.status.value ==
                                              'Sudah Presensi'
                                          ? Colors.green
                                          : Colors.red),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    GetBuilder<PresenceController>(
                        init: PresenceController(
                            ),
                        builder: (value) {
                          return Visibility(
                            visible: controller.file != null,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 16, right: 16, top: 136),
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 200,
                                    height: 200,
                                    child: controller.file != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.memory(
                                              controller.file!,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : Container(),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.chooseCamera();
                                    },
                                    child: Center(
                                      child: Text(
                                        'Ganti Foto',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.amber[400],
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 100,
                                        vertical: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.onPresences(
                                          classData.classId!,
                                          classData.title!,
                                          classData.teacher!,
                                          classData.classTime.toString(),
                                          classData.className!);
                                    },
                                    child: Center(
                                      child: Text(
                                        'Absen Sekarang',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 100,
                                        vertical: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  controller.getCurrentLocation();
                },
                child: Obx(() => controller.isLoading.value
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      )),
              ),
            ),
          );
        });
  }
}
