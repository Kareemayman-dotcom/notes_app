import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/simple_bloc_observer.dart';

import 'constants.dart';
import 'cubits/language_cubit/language_cubit.dart';
import 'generated/l10n.dart';
import 'views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  Bloc.observer = MyBlocObserver();
   final languageCubit = LanguageCubit();

  // Listen to system locale changes
  PlatformDispatcher.instance.onLocaleChanged = () {
    final newLocale = PlatformDispatcher.instance.locale;
    languageCubit.updateLanguage(newLocale);
  };
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        print(PlatformDispatcher.instance.locale);
        return BlocProvider(
          create: (context) => NotesCubit(),
          child: BlocListener<NotesCubit, NotesState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            child: MaterialApp(
              // locale: Locale('ar_EG'),
              locale: Locale(extractSupportedLanguageCode(
                  PlatformDispatcher.instance.locale.toString())),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: ThemeData(
                fontFamily: 'assets/fonts/Poppins-Regular.ttf',
                brightness: Brightness.dark,
              ),
              debugShowCheckedModeBanner: false,
              home: const NotesView(),
            ),
          ),
        );
      },
    );
  }
}

bool isLanguageCodeSupported(String languageCode) {
  return S.delegate.isSupported(Locale(languageCode));
}

String extractSupportedLanguageCode(String languageCode) {
  if (isLanguageCodeSupported(languageCode)) {
    return languageCode;
  } else {
    // Split the language code by "_" and use the first part
    List<String> parts = languageCode.split('_');
    if (parts.isNotEmpty) {
      return parts[0];
    } else {
      // If splitting fails, return a default language code (e.g., "en")
      return "en";
    }
  }
}
