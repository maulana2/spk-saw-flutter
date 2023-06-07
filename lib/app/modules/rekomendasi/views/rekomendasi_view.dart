import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spk_apk/app/models/jurusan_models.dart';
import 'package:spk_apk/app/modules/home/controllers/home_controller.dart';

class RekomendasiView extends GetView<HomeController> {
  RekomendasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rekomendasi'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: controller.listJurusan.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                    child: Text(
                  controller.listJurusan[index].namaJurusan.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              );
            },
          ),
        ));
  }
}
