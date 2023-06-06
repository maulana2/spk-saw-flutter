import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spk_apk/app/shared/style.dart';

class CustomInputNilai extends StatelessWidget {
  final title;
  TextEditingController controller;
  CustomInputNilai({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: 2,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.px),
        hintText: title,
        hintStyle: regulerTextStyle.copyWith(
          fontSize: 13.px,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.px),
          gapPadding: 0,
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
