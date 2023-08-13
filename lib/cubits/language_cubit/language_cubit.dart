import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(PlatformDispatcher.instance.locale); // Set the initial locale

  void updateLanguage(Locale newLocale) {
    emit(newLocale);
  }
}
