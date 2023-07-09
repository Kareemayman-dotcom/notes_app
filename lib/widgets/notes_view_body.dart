import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/notes_item.dart';
import 'package:sizer/sizer.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

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
            title: 'Notes',
            icon: Icon(
              FontAwesome.magnifying_glass,
              color: Colors.white,
              size: 15.sp,
            ),
          ),
          NotesListView()
        ],
      ),
    );
  }
}

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];

        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 1.h,
            ),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NotesItem(
                title: notes[index].title,
                content: notes[index].content,
              );
            },
          ),
        );
      },
    );
  }
}
