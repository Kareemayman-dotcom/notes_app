part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNotesuccess extends AddNoteState {}

class AddNotefailure extends AddNoteState {
  final String errMsg;

  AddNotefailure(this.errMsg);
}
