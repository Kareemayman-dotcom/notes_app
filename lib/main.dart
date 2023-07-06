import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/simple_bloc_observer.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';

import 'constants.dart';
import 'cubits/add_note_cubit/add_note_cubit.dart';
import 'views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NoteModelAdapter());
  Bloc.observer = MyBlocObserver();
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => const NotesApp(),
  ));
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AddNoteCubit(),
            )
          ],
          child: MaterialApp(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
              fontFamily: 'assets/fonts/Poppins-Regular.ttf',
              brightness: Brightness.dark,
            ),
            debugShowCheckedModeBanner: false,
            home: NotesView(),
          ),
        );
      },
    );
  }
}
