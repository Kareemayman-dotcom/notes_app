import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

import 'package:notes_app/widgets/custom_textfield.dart';

import '../models/note_model.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel noteModel;
  const EditNoteViewBody({
    Key? key,
    required this.noteModel,
  }) : super(key: key);

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
    final String? title;
    final String? content;

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
           CustomAppBar(
            title: 'Edit Notes',
            icon: const Icon(FontAwesome.check),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Edit Notes',
          //       style: TextStyle(
          //         fontSize: 18.sp,
          //       ),
          //     ),
          //     CustomIconButton(
          //       icon: const Icon(FontAwesome.check),
          //       onTap: () {},
          //     ),
          //   ],
          // ),
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
