import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/notes_item.dart';
import 'package:sizer/sizer.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 5.h,
        left: 7.w,
        right: 7.w,
      ),
      child: Column(
        children: [CustomAppBar(title: 'Notes',icon: Icon(
            FontAwesome.magnifying_glass,
            color: Colors.white,
            size: 15.sp,
          ),), NotesListView()],
      ),
    );
  }
}

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 1.h,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return NotesItem();
        },
      ),
    );
  }
}
