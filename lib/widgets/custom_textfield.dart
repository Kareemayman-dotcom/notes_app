import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  String? hintText;
  int? maxLines;
  int? maxLength;
  BoxConstraints? constraints;
  CustomTextField({
    Key? key,
    this.hintText,
    this.maxLines,
    this.maxLength,
    this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // maxLines = null;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
      child: Scrollbar(
        radius: Radius.circular(20),
        child: TextField(
          maxLength: maxLength,
          scribbleEnabled: true,
          maxLines: maxLines,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
              border: buildBorder(),
              enabledBorder: buildBorder(),
              focusedBorder: buildBorder(kPrimaryColor),
              hintText: hintText,
              constraints: constraints ??
                  BoxConstraints(
                    maxHeight: 25.h,
                  )),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ));
  }
}
