import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spk_apk/app/config/list_jurusan.dart';
import 'package:spk_apk/app/models/jurusan_models.dart';
import 'package:spk_apk/app/models/nilai_models.dart';
import 'package:spk_apk/app/shared/style.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  TextEditingController matematikaC = TextEditingController();
  TextEditingController bInggrisC = TextEditingController();
  TextEditingController ipaC = TextEditingController();
  TextEditingController ipsC = TextEditingController();
  RxList<Nilai> nilai = <Nilai>[].obs;
  List<double> minValues = [];
  List<double> maxValues = [];
  double meanMtk = 0;
  double meanBinggris = 0;
  double meanIpa = 0;
  double meanIps = 0;
  double minMtk = double.infinity;
  double maxMtk = 0;
  double minBinggris = double.infinity;
  double maxBinggris = 0;
  double minIpa = double.infinity;
  double maxIpa = 0;
  double minIps = double.infinity;
  double maxIps = 0;
  List<Jurusan> listJurusan = daftarJurusan;
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

  void searchMinMaxMean() {
    //Menghitung rata rata

    double meanMtk = 0;
    double meanBinggris = 0;
    double meanIpa = 0;
    double meanIps = 0;

    for (int i = 0; i < nilai.length; i++) {
      Nilai data = nilai[i];

      if (data.mtk != null) {
        meanMtk += data.mtk!;
      }
      if (data.binggris != null) {
        meanBinggris += data.binggris!;
      }
      if (data.ipa != null) {
        meanIpa += data.ipa!;
      }
      if (data.ips != null) {
        meanIps += data.ips!;
      }
    }

    meanMtk /= nilai.length;
    meanBinggris /= nilai.length;
    meanIpa /= nilai.length;
    meanIps /= nilai.length;

    print('Nilai mean per mata pelajaran:');
    print('Matematika: $meanMtk');
    print('Bahasa Inggris: $meanBinggris');
    print('IPA: $meanIpa');
    print('IPS: $meanIps');

    //end
    //menghitung min max

    for (int i = 0; i < nilai.length; i++) {
      Nilai data = nilai[i];

      if (data.mtk != null) {
        if (data.mtk! < minMtk) {
          minMtk = data.mtk!;
        }
        if (data.mtk! > maxMtk) {
          maxMtk = data.mtk!;
        }
      }
      if (data.binggris != null) {
        if (data.binggris! < minBinggris) {
          minBinggris = data.binggris!;
        }
        if (data.binggris! > maxBinggris) {
          maxBinggris = data.binggris!;
        }
      }
      if (data.ipa != null) {
        if (data.ipa! < minIpa) {
          minIpa = data.ipa!;
        }
        if (data.ipa! > maxIpa) {
          maxIpa = data.ipa!;
        }
      }
      if (data.ips != null) {
        if (data.ips! < minIps) {
          minIps = data.ips!;
        }
        if (data.ips! > maxIps) {
          maxIps = data.ips!;
        }
      }
    }
    print('Nilai minimum dan maksimum per mata pelajaran:');
    print('Matematika: Min=$minMtk, Max=$maxMtk');
    print('Binggris: Min=$minBinggris, Max=$maxBinggris');
    print('Ipa: Min=$minIpa, Max=$maxIpa');
    print('Ips: Min=$minIps, Max=$maxIps');
//end
//normalisasi

    double nilaiNormalisasiMtk = (meanMtk - minMtk) / (maxMtk - minMtk);
    double nilaiNormalisasiBinggris =
        (meanBinggris - minBinggris) / (maxBinggris - minBinggris);
    double nilaiNormalisasiIpa = (meanIpa - minIpa) / (maxIpa - minIpa);
    double nilaiNormalisasiIps = (meanIps - minIps) / (maxIps - minIps);
    print('Nilai normalisasi per mata pelajaran:');
    print('Matematika: ${nilaiNormalisasiMtk}');
    print('Bahasa Inggris: ${nilaiNormalisasiBinggris}');
    print('IPA: ${nilaiNormalisasiIpa}');
    print('IPS: ${nilaiNormalisasiIps}');
    //end
    //menghitung preferensi
    for (var jurusan in listJurusan) {
      double preferensi = (nilaiNormalisasiMtk * jurusan.mtk!) +
          (nilaiNormalisasiBinggris * jurusan.binggris!) +
          (nilaiNormalisasiIps * jurusan.ips!) +
          (nilaiNormalisasiIpa * jurusan.ipa!);
      jurusan.preferensi = preferensi;
    }

    // Mengurutkan list jurusan berdasarkan nilai preferensi
    listJurusan.sort((a, b) => b.preferensi!.compareTo(a.preferensi!));
    print(listJurusan);
  }

  void calculateNormalisasi() {}

  void resetValue() {
    matematikaC.text = '';
    bInggrisC.text = '';
    ipaC.text = '';
    ipsC.text = '';
  }

  bool checkNilaiKosong() {
    if (matematikaC.text.isEmpty ||
        bInggrisC.text.isEmpty ||
        ipaC.text.isEmpty ||
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
