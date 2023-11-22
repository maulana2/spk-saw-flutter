import 'package:get/get.dart';
import 'package:spk_apk/app/routes/app_pages.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;
  final welcome =
      'Pilih minat dan jurusanmu, Untuk masa depan yang lebih baik'.obs;
  @override
  void onInit() async {
    Future.delayed(
      Duration(seconds: 5),
      () => Get.offAndToNamed(Routes.HOME),
    );

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
