import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onscreen_keyboard/bloc/keyboard_shift/keyboard_shift_bloc.dart';
import 'package:onscreen_keyboard/data/loading.dart';
import 'package:onscreen_keyboard/src/button.dart';
import 'package:onscreen_keyboard/src/utils.dart';

///
///
class OnscreenKeyboard extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String value;
  final InitialCase initialCase;
  final Color borderColor;
  final Color backgroundColor;
  final Color buttonColor;
  final Color focusColor;
  OnscreenKeyboard({
    this.onChanged,
    this.backgroundColor,
    this.focusColor,
    this.borderColor,
    this.buttonColor,
    this.value,
    @required this.initialCase,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<KeyboardShiftBloc>(
            create: (context) => KeyboardShiftBloc()),
      ],
      child: OnscreenKeyboardWidget(
        onChanged: onChanged,
        initialCase: initialCase,
        value: value,
        borderColor: borderColor,
        backgroundColor: backgroundColor,
        buttonColor: buttonColor,
        focusColor: focusColor,
      ),
    );
  }
}

class OnscreenKeyboardWidget extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final InitialCase initialCase;
  final String value;
  final Color borderColor;
  final Color backgroundColor;
  final Color buttonColor;
  final Color focusColor;
  OnscreenKeyboardWidget({
    this.onChanged,
    this.backgroundColor,
    this.focusColor,
    this.borderColor,
    this.buttonColor,
    this.value,
    this.initialCase,
  });
  @override
  _OnscreenKeyboardWidgetState createState() => _OnscreenKeyboardWidgetState();
}

class _OnscreenKeyboardWidgetState extends State<OnscreenKeyboardWidget> {
  String text = '';
  InitialCase _initialCase;
  @override
  void initState() {
    //
    super.initState();
    if (widget.value != null) {
      text = widget.value;
      _initialCase = widget.initialCase;
    }
  }

  void specialCharacters() {
    //
    var state = BlocProvider.of<KeyboardShiftBloc>(context).state;
    if (state is KeyboardShiftSymbols) {
      BlocProvider.of<KeyboardShiftBloc>(context)
          .add(KeyboardShiftUpperCaseEvent());
    } else {
      BlocProvider.of<KeyboardShiftBloc>(context)
          .add(KeyboardShiftSymbolsEvent());
    }
  }

  void shift() {
    var state = BlocProvider.of<KeyboardShiftBloc>(context).state;
    if (state is KeyboardShiftUpperCase) {
      BlocProvider.of<KeyboardShiftBloc>(context)
          .add(KeyboardShiftLowerCaseEvent());
    } else if (state is KeyboardShiftLowerCase) {
      BlocProvider.of<KeyboardShiftBloc>(context)
          .add(KeyboardShiftUpperCaseEvent());
    }
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    switch (widget.initialCase) {
      case InitialCase.UPER_CASE:
        BlocProvider.of<KeyboardShiftBloc>(context)
            .add(KeyboardShiftUpperCaseEvent());

        break;
      case InitialCase.LOWER_CASE:
        BlocProvider.of<KeyboardShiftBloc>(context)
            .add(KeyboardShiftLowerCaseEvent());
        break;
      case InitialCase.SENTENSE_CASE:
        BlocProvider.of<KeyboardShiftBloc>(context)
            .add(KeyboardShiftUpperCaseEvent());
        break;
      case InitialCase.NUMERIC:
        BlocProvider.of<KeyboardShiftBloc>(context)
            .add(KeyboardShiftSymbolsEvent());
        break;

      default:
        BlocProvider.of<KeyboardShiftBloc>(context)
            .add(KeyboardShiftUpperCaseEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Container(
                  color: widget.backgroundColor != null
                      ? widget.backgroundColor
                      : Colors.transparent,
                  child: BlocBuilder<KeyboardShiftBloc, KeyboardShiftState>(
                      builder: (context, state) {
                    //
                    if (state is KeyboardShiftLowerCase) {
                      return _buildBody(state.lowerCase);
                    } else if (state is KeyboardShiftUpperCase) {
                      return _buildBody(state.upperCase);
                    } else if (state is KeyboardShiftLoading) {
                      return _buildBody(state.loading);
                    } else if (state is KeyboardShiftSymbols) {
                      return _buildBody(state.symbols);
                    } else {
                      return _buildBody(loading);
                    }
                  }),
                ),
              ),
              Container(
                color: widget.backgroundColor != null
                    ? widget.backgroundColor
                    : Colors.transparent,
                child: new Row(
                  children: <Widget>[
                    Flexible(
                      child: new Button(
                        autofocus: false,
                        focusColor: widget.focusColor ?? widget.focusColor,
                        borderColor: widget.borderColor ?? widget.borderColor,
                        buttonColor: widget.buttonColor ?? widget.buttonColor,
                        onPressed: () {
                          shift();
                        },
                        label: new Icon(
                          Icons.arrow_upward,
                        ),
                      ),
                    ),
                    Flexible(
                      child: new Button(
                        autofocus: false,
                        focusColor: widget.focusColor ?? widget.focusColor,
                        borderColor: widget.borderColor ?? widget.borderColor,
                        buttonColor: widget.buttonColor ?? widget.buttonColor,
                        onPressed: () {
                          text = '';
                          setState(() {});
                          widget.onChanged(text);
                        },
                        label: new Text(
                          'CLEAR',
                          style: new TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Flexible(
                      child: new Button(
                        autofocus: true,
                        focusColor: widget.focusColor ?? widget.focusColor,
                        borderColor: widget.borderColor ?? widget.borderColor,
                        buttonColor: widget.buttonColor ?? widget.buttonColor,
                        onPressed: () {
                          text = text + ' ';
                          setState(() {});
                          widget.onChanged(text);
                        },
                        label: new Icon(
                          Icons.space_bar,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Button(
                autofocus: false,
                focusColor: widget.focusColor ?? widget.focusColor,
                borderColor: widget.borderColor ?? widget.borderColor,
                buttonColor: widget.buttonColor ?? widget.buttonColor,
                onPressed: () {
                  if (text.length > 0) {
                    text = text.substring(0, text.length - 1);
                  }
                  setState(() {});
                  widget.onChanged(text);
                },
                label: new Icon(
                  Icons.backspace,
                  size: 20,
                ),
              ),
              new Button(
                autofocus: false,
                focusColor: widget.focusColor ?? widget.focusColor,
                borderColor: widget.borderColor ?? widget.borderColor,
                buttonColor: widget.buttonColor ?? widget.buttonColor,
                onPressed: () {
                  specialCharacters();
                },
                label: new BlocBuilder<KeyboardShiftBloc, KeyboardShiftState>(
                  builder: (context, state) {
                    if (state is KeyboardShiftSymbols) {
                      return Text(
                        'ABC',
                        style: new TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      );
                    } else {
                      return Text(
                        '&123',
                        style: new TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody(List<String> labels) {
    //
    return GridView.builder(
        shrinkWrap: true,
        itemCount: labels.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemBuilder: (context, index) {
          return new Button(
            autofocus: false,
            focusColor: widget.focusColor ?? widget.focusColor,
            borderColor: widget.borderColor ?? widget.borderColor,
            buttonColor: widget.buttonColor ?? widget.buttonColor,
            label: new Text(
              labels[index],
              style: new TextStyle(fontSize: 25),
            ),
            onPressed: () {
              text = text + labels[index];
              setState(() {});
              widget.onChanged(text);
            },
          );
        });
  }
}
