import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';

import 'constants.dart';
import 'views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => NotesApp(),
  ));
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: ThemeData(
            fontFamily: 'assets/fonts/Poppins-Regular.ttf',
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: NotesView(),
        );
      },
    );
  }
}
