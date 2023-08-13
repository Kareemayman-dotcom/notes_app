
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/edit_note_colors_list.dart';
import 'package:sizer/sizer.dart';

import 'package:notes_app/widgets/custom_textfield.dart';

import '../generated/l10n.dart';
import '../models/note_model.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel note;
  const EditNoteViewBody({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title;
  String? content;

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
            title: S.of(context).edit_note_appbar_title,
            icon: const Icon(FontAwesome.check),
            onTap: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
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
            hintText: S.of(context).note_textfield_title,
            maxLines: 1,
            initialValue: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextField(
            hintText: S.of(context).note_textfield_content,
            maxLines: 250,
            initialValue: widget.note.content,
            onChanged: (value) {
              content = value;
            },
            constraints: BoxConstraints(
              maxHeight: 40.h,
            ),
          ),
          EditNoteColorsList(
            note: widget.note,
          )
        ],
      ),
    );
  }
}
