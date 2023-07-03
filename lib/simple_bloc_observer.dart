import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    //debugPrint better than print because print will be with the release otherwise with debugPrint
    debugPrint("change = $change");
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("close = $bloc");
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("create = $bloc");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint("Error = $bloc");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint("Event = $bloc");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint("Transition = $bloc");
  }
}
