import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/simple_bloc_observer.dart';

import 'constants.dart';
import 'views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  Bloc.observer = MyBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (context) => NotesCubit(),
          child: MaterialApp(
            theme: ThemeData(
              fontFamily: 'assets/fonts/Poppins-Regular.ttf',
              brightness: Brightness.dark,
            ),
            debugShowCheckedModeBanner: false,
            home: const NotesView(),
          ),
        );
      },
    );
  }
}
