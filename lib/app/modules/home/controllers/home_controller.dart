import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spk_apk/app/models/nilai_models.dart';
import 'package:spk_apk/app/shared/style.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  TextEditingController matematikaC = TextEditingController();
  TextEditingController bInggrisC = TextEditingController();
  TextEditingController ipaC = TextEditingController();
  TextEditingController ipsC = TextEditingController();
  RxList<Nilai> nilai = <Nilai>[].obs;

  addNilai() {
    try {
      double matematika = double.parse(matematikaC.text);
      double bInggris = double.parse(bInggrisC.text);
      double ipa = double.parse(ipaC.text);
      double ips = double.parse(ipsC.text);

      Nilai nilaiSementara = Nilai(
        mtk: matematika,
        binggris: bInggris,
        ipa: ipa,
        ips: ips,
      );
      nilai.add(nilaiSementara);
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }

  void resetValue() {
    matematikaC.text = '';
    bInggrisC.text = '';
    ipaC.text = '';
    ipsC.text = '';
  }

  bool checkNilaiKosong() {
    if (matematikaC.text.isEmpty &&
        bInggrisC.text.isEmpty &&
        ipaC.text.isEmpty &&
        ipsC.text.isEmpty) {
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
      return true;
    } else {
      return false;
    }
  }
}
