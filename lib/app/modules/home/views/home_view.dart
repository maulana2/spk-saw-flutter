import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spk_apk/app/models/nilai_models.dart';
import 'package:spk_apk/app/routes/app_pages.dart';
import 'package:spk_apk/app/shared/style.dart';
import 'package:spk_apk/app/widgets/card_nilai.dart';
import 'package:spk_apk/app/widgets/custom_input_nilai_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Rekomendasi Jurusan',
          style: regulerTextStyle.copyWith(
            fontSize: 20.px,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.px),
        child: ListView(
          children: [
            _alert(),
            _buttonTambahNilai(controller),
            Obx(() => controller.nilai.isNotEmpty
                ? Container(
                    padding: EdgeInsets.all(12.px),
                    margin: EdgeInsets.only(top: 15.px),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.px),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Data Nilai',
                          style: regulerTextStyle.copyWith(
                            fontSize: 13.px,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.nilai.length,
                          itemBuilder: (context, index) {
                            return CardNilaiWidget(
                                controller: controller, index: index);
                          },
                        )
                      ],
                    ),
                  )
                : const SizedBox()),
            buttonLihatRekomendasi(controller.nilai),
          ],
        ),
      ),
    );
  }

  Container buttonLihatRekomendasi(RxList list) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        onPressed: () {
          bool isEmpty = controller.checkNilaiKosong();
          if (list.isNotEmpty) {
            Get.toNamed(Routes.REKOMENDASI, arguments: controller.listJurusan);
          } else {
            Get.defaultDialog(
              content: SizedBox(),
              title: 'Nilai tidak boleh kosong',
              titleStyle: regulerTextStyle.copyWith(
                fontSize: 15.px,
              ),
              onConfirm: () {
                Get.back();
              },
            );
          }
        },
        child: const Text(
          'Lihat Rekomendasi',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

_alert() {
  return Container(
    padding: EdgeInsets.all(17.px),
    margin: EdgeInsets.only(top: 10.px, bottom: 20.px),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.grey,
      ),
      boxShadow: [
        const BoxShadow(
            blurRadius: 4,
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4))
      ],
      borderRadius: BorderRadius.circular(12.px),
    ),
    child: Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          'Cara Penggunaan',
          style: regulerTextStyle.copyWith(
            fontSize: 15.px,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          '1. Masukan Nilai Per Semester',
          style: regulerTextStyle.copyWith(
            fontSize: 13.px,
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          '2. Untuk Nilai IPA masukan nilai rata rata pelajaran IPA pada semester yang sama',
          style: regulerTextStyle.copyWith(
            fontSize: 13.px,
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          '3. Untuk Nilai IPS masukan nilai rata rata pelajaran IPS pada semester yang sama',
          style: regulerTextStyle.copyWith(
            fontSize: 13.px,
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          '4. Setelah dimasukan nilai maka otomatis akan muncul rekomendasi',
          style: regulerTextStyle.copyWith(
            fontSize: 13.px,
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          '5. Semakin banyak nilai per semester yang dimasukan dapat membantu tingkat akurat rekomendasi',
          style: regulerTextStyle.copyWith(
            fontSize: 13.px,
          ),
        ),
      ],
    ),
  );
}

_openDialog(HomeController controller) {
  Get.defaultDialog(
      titleStyle: regulerTextStyle.copyWith(
        fontSize: 15.px,
      ),
      title: 'Masukan nilai sekolah',
      content: Container(
        child: Column(
          children: [
            CustomInputNilai(
              controller: controller.matematikaC,
              title: "Matematika",
            ),
            CustomInputNilai(
              controller: controller.bInggrisC,
              title: "Bahasa Inggris",
            ),
            CustomInputNilai(
              controller: controller.ipaC,
              title: "IPA",
            ),
            CustomInputNilai(
              controller: controller.ipsC,
              title: "IPS",
            ),
          ],
        ),
      ),
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.px),
            )),
        onPressed: () async {
          bool isEmpty = await controller.checkNilaiKosong();
          if (isEmpty == false) {
            //jalanin function add nilai
            controller.addNilai();
            controller.searchMinMaxMean();
            controller.calculateNormalisasi();
            print(controller.nilai.length);
            Get.back();
            Get.snackbar(
              'Succes',
              'Berhasil Menambahkan Nilai',
            );
          } else {
            //tidak menjalankan function add nilai
          }
        },
        child: Text(
          'Confirm',
          style: regulerTextStyle.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      cancel: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.px),
          ),
          backgroundColor: Colors.red,
        ),
        onPressed: () => Get.back(),
        child: Text('Cancel',
            style: regulerTextStyle.copyWith(
              color: Colors.white,
            )),
      ));
}

_buttonTambahNilai(HomeController controller) {
  return MaterialButton(
    onPressed: () {
      controller.resetValue();
      _openDialog(controller);
    },
    height: 50.px,
    minWidth: 50.w,
    color: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.px),
    ),
    child: Row(
      children: [
        const Icon(
          Icons.add,
          color: Colors.white,
        ),
        Text(
          'Tambah nilai',
          style: regulerTextStyle.copyWith(
            fontSize: 16.px,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
