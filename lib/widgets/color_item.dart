import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColorItem extends StatelessWidget {
  final bool? isAcive;
  final Color color;
  const ColorItem({
    Key? key,
    this.isAcive = false,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isAcive!
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 26.sp,
            child: CircleAvatar(
              radius: 23.sp,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 26.sp,
            backgroundColor: color,
          );
  }
}