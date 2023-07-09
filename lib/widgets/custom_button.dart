import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  VoidCallback? onTap;
  final String? title;
  final String? content;
  bool isLoading;
  CustomButton({
    Key? key,
    this.onTap,
    required this.title,
    required this.content,
    this.isLoading = false,
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
          child: isLoading == false
              ? Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : CircularProgressIndicator(
                  color: Colors.black
                  ,
                ),
        ),
      ),
    );
  }
}
