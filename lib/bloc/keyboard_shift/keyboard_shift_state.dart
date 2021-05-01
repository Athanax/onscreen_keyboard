part of 'keyboard_shift_bloc.dart';

abstract class KeyboardShiftState extends Equatable {
  const KeyboardShiftState();

  @override
  List<Object> get props => [];
}

class KeyboardShiftInitial extends KeyboardShiftState {
  const KeyboardShiftInitial();
}

class KeyboardShiftLoading extends KeyboardShiftState {
  final List<String> loading;
  const KeyboardShiftLoading(this.loading);
}

class KeyboardShiftUpperCase extends KeyboardShiftState {
  final List<String> upperCase;
  const KeyboardShiftUpperCase(this.upperCase);
}

class KeyboardShiftLowerCase extends KeyboardShiftState {
  final List<String> lowerCase;
  const KeyboardShiftLowerCase(this.lowerCase);
}

class KeyboardShiftSymbols extends KeyboardShiftState {
  final List<String> symbols;
  const KeyboardShiftSymbols(this.symbols);
}
