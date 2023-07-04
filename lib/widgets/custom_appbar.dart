import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

import 'custom_icon_btn.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Icon icon;
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Notes',
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
         CustomIconButton(icon: icon,),
      ],
    );
  }
}
