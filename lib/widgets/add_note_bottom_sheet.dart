import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:sizer/sizer.dart';

import 'custom_textfield.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 50.h),
      padding: EdgeInsets.only(
        top: 2.h,
        right: 5.w,
        left: 5.w,
      ),
      decoration: BoxDecoration(
          color: ThemeData.dark().canvasColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          CustomTextField(
            hintText: "Title",
            maxLines: 1,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextField(
            hintText: "content",
            maxLines: 250,
          ),
          SizedBox(
            height: 2.h,
          ),
          GestureDetector(
            onTap: () {},
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
          )
        ],
      ),
    );
  }
}
