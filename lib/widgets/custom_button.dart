import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:notes_app/constants.dart';

import '../models/note_model.dart';

class CustomButton extends StatelessWidget {
  VoidCallback? onTap;
  final String? title;
  final String? content;
  CustomButton({
    Key? key,
    this.onTap,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 6.h,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'Save',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
