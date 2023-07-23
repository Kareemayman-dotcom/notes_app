import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  List<NoteModel>? notes;
  dynamic notesBox;
  NotesCubit() : super(NotesInitial());
  fetchAllNotes() {
    notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();

    emit(NotesSuccess());
  }
void saveNotesToHive(List<NoteModel> notes) async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    await notesBox.clear(); // Clear the existing notes in the box
    await notesBox.addAll(notes); // Save the reordered notes to the box
  }
  void notesReorder({required int oldIndex, required int newIndex}) {
    // Reorder the notes list locally.
    final reorderedNote = notes!.removeAt(oldIndex);
    notes!.insert(newIndex, reorderedNote);

    // Update the keys of reordered notes in the Hive box.
    for (int i = 0; i < notes!.length; i++) {
      notes![i].key = i.toString();
    }

    // Save the reordered notes to Hive.
    saveNotesToHive(notes!);

    // Emit a new state with the reordered notes list.
    emit(NotesReorderd());
  }
}
