import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  const CustomIconButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.sp,
      width: 30.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(120, 100, 100, 100),
      ),
      child: icon,
    );
  }
}
