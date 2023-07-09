import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_icon_btn.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Icon icon;
   final void Function()? onTap;
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
         CustomIconButton(icon: icon,onTap: onTap,),
      ],
    );
  }
}
