import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class MyBlocObserver implements BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {}

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    debugPrint('$change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onChange
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    debugPrint('close: $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    debugPrint('create: $bloc');
  }
}
