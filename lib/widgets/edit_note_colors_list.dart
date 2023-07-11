import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:notes_app/models/note_model.dart';

import '../constants.dart';
import 'color_item.dart';

class EditNoteColorsList extends StatefulWidget {
  final NoteModel note;
  const EditNoteColorsList({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex =
        kColorsList.indexWhere((color) => color.value == widget.note.color);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: kColorsList.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 2.w,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.note.color = kColorsList[index].value;
              setState(() {});
            },
            child: ColorItem(
              color: kColorsList[index],
              isAcive: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}
