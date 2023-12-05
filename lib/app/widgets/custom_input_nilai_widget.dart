import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return Container(
      margin: EdgeInsets.only(bottom: 10.px),
      child: TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(2)],
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.px, horizontal: 10.px),
          hintText: title,
          hintStyle: regulerTextStyle.copyWith(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.px),
            gapPadding: 0,
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
