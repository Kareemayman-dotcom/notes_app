import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notes_app/widgets/custom_icon_btn.dart';
import 'package:notes_app/widgets/custom_textfield.dart';
import 'package:sizer/sizer.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 5.h,
        left: 7.w,
        right: 7.w,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Edit Notes',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              CustomIconButton(icon: const Icon(FontAwesome.check)),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextField(
            hintText: 'Title',
            maxLines: 1,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextField(
            hintText: 'Content',
            maxLines: 250,
            constraints: BoxConstraints(
              maxHeight: 40.h,
            ),
          ),
        ],
      ),
    );
  }
}
