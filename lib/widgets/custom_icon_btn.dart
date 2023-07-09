import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final void Function()? onTap;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required  this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30.sp,
        width: 30.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(120, 100, 100, 100),
        ),
        child: icon,
      ),
    );
  }
}
