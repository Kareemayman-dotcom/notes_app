import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:sizer/sizer.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Container(
        width: 80.w,
        height: 55.h,
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
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNotefailure) {
              debugPrint('failed ${state.errMsg}');
            } else if (state is AddNotesuccess) {
              Navigator.pop(context);
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: const AddNoteForm(),
            );
          },
        ),
      ),
    );
  }
}
