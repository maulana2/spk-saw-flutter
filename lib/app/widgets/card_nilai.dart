import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spk_apk/app/modules/home/controllers/home_controller.dart';

import '../shared/style.dart';

class CardNilaiWidget extends StatelessWidget {
  final HomeController controller;
  final int index;
  const CardNilaiWidget(
      {super.key, required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.px),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.px),
          border: Border.all(
            color: const Color.fromARGB(255, 71, 64, 64),
          )),
      child: Container(
        padding: EdgeInsets.all(12.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Semester ${this.index + 1}'),
                IconButton(
                  onPressed: () {
                    controller.nilai.removeAt(index);
                  },
                  icon: Icon(Icons.remove_circle_outline, color: Colors.red),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.px),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Matematika',
                        style: regulerTextStyle.copyWith(
                          fontSize: 13.px,
                        ),
                      ),
                      Text(controller.nilai[index].mtk.toString())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bahasa Inggris',
                        style: regulerTextStyle.copyWith(
                          fontSize: 13.px,
                        ),
                      ),
                      Text(controller.nilai[index].binggris.toString())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'IPS',
                        style: regulerTextStyle.copyWith(
                          fontSize: 13.px,
                        ),
                      ),
                      Text(controller.nilai[index].ips.toString())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'IPA',
                        style: regulerTextStyle.copyWith(
                          fontSize: 13.px,
                        ),
                      ),
                      Text(controller.nilai[index].ipa.toString())
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
