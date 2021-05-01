part of 'keyboard_shift_bloc.dart';

abstract class KeyboardShiftEvent extends Equatable {
  const KeyboardShiftEvent();

  @override
  List<Object> get props => [];
}

class KeyboardShiftUpperCaseEvent extends KeyboardShiftEvent {
  const KeyboardShiftUpperCaseEvent();
}

class KeyboardShiftLowerCaseEvent extends KeyboardShiftEvent {
  const KeyboardShiftLowerCaseEvent();
}

class KeyboardShiftSymbolsEvent extends KeyboardShiftEvent {
  const KeyboardShiftSymbolsEvent();
}
