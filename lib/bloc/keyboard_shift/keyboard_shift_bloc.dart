import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onscreen_keyboard/data/loading.dart';
import 'package:onscreen_keyboard/data/lower_case.dart';
import 'package:onscreen_keyboard/data/symbols.dart';
import 'package:onscreen_keyboard/data/upper_case.dart';

part 'keyboard_shift_event.dart';
part 'keyboard_shift_state.dart';

class KeyboardShiftBloc extends Bloc<KeyboardShiftEvent, KeyboardShiftState> {
  KeyboardShiftBloc() : super(KeyboardShiftInitial()) {
    on((event, emit) => (emit(KeyboardShiftLoading(loading))));

    on<KeyboardShiftUpperCaseEvent>((event, emit) {
      //
      emit(KeyboardShiftUpperCase(upperCase));
    });
    on<KeyboardShiftSymbolsEvent>((event, emit) {
      //
      emit(KeyboardShiftSymbols(symbols));
    });
    on<KeyboardShiftLowerCaseEvent>((event, emit) {
      //
      emit(KeyboardShiftLowerCase(lowerCase));
    });
  }
}
