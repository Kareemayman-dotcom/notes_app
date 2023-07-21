import 'dart:math';

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

class NotesListView extends StatefulWidget {
  NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

enum DraggingMode {
  iOS,
  android,
}

class _NotesListViewState extends State<NotesListView> {
  late List<NoteModel> notes;
  @override
  void initState() {
    super.initState();

    notes = BlocProvider.of<NotesCubit>(context).notes ?? [];
  }

  // Returns index of item with given key
  int _indexOfKey(Key key) {
    return notes.indexWhere((NoteModel d) => d.key == key);
  }

  bool _reorderCallback(Key item, Key newPosition) {
    int draggingIndex = _indexOfKey(item);
    int newPositionIndex = _indexOfKey(newPosition);

    // Uncomment to allow only even target reorder possition
    // if (newPositionIndex % 2 == 1)
    //   return false;

    final draggedItem = notes[draggingIndex];
    setState(() {
      debugPrint("Reordering $item -> $newPosition");
      notes.removeAt(draggingIndex);
      notes.insert(newPositionIndex, draggedItem);
    });
    return true;
  }

  void _reorderDone(Key item) {
    final draggedItem = notes[_indexOfKey(item)];
    debugPrint("Reordering finished for ${draggedItem.title}}");
  }

  //
  // Reordering works by having ReorderableList widget in hierarchy
  // containing ReorderableItems widgets
  //

  DraggingMode _draggingMode = DraggingMode.iOS;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return Expanded(
          child: ReorderableListView(
            onReorder: (int oldIndex, int newIndex) {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              BlocProvider.of<NotesCubit>(context)
                  .notesReorder(oldIndex: oldIndex, newIndex: newIndex);
            },
            children: List.generate(
              notes.length,
              (index) => NotesItem(
                key: ValueKey(notes[index].key), // Use ValueKey with note's key
                note: notes[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
