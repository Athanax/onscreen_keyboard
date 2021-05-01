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
  KeyboardShiftBloc() : super(KeyboardShiftInitial());

  @override
  Stream<KeyboardShiftState> mapEventToState(KeyboardShiftEvent event) async* {
    //
    yield KeyboardShiftLoading(loading);
    if (event is KeyboardShiftUpperCaseEvent) {
      //
      yield KeyboardShiftUpperCase(upperCase);
    } else if (event is KeyboardShiftSymbolsEvent) {
      //
      yield KeyboardShiftSymbols(symbols);
    } else if (event is KeyboardShiftLowerCaseEvent) {
      //
      yield KeyboardShiftLowerCase(lowerCase);
    }
  }
}
