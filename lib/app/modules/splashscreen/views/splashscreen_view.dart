import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spk_apk/app/modules/home/controllers/home_controller.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(bottom: 10.px),
                height: 120.px,
                width: 120.px,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.px),
                ),
              ),
            ),
            Text(
              controller.welcome.string,
              style: GoogleFonts.abel(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
