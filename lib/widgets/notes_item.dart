import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:sizer/sizer.dart';

import 'package:notes_app/views/edit_note_view.dart';

class NotesItem extends StatelessWidget {
  final NoteModel note;
  const NotesItem({
    Key? key,
    required this.note,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return EditNoteView(noteModel: note,);
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: Color(0xffFFCC80)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              textColor: Colors.black,
              contentPadding:
                  EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h, bottom: 1.h),
              // tileColor: Colors.yellow,
              title: Text(
                note.title,
                style: TextStyle(
                  fontSize: 17.sp,
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: .7.h),
                child: Text(
                  note.content,
                  style: TextStyle(
                      fontSize: 13.sp, color: Colors.black.withOpacity(0.5)),
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    child: Icon(
                      FontAwesome.trash,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 4.w,
                bottom: 2.h,
              ),
              child: Text(
                note.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
