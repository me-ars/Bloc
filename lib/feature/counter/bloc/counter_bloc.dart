import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  int count = 0;

  CounterBloc() : super(CounterInitial()) {
    on<CounterValueIncrementEvent>(counterValueIncrementEvent);
    on<ShowSnackBarEvent>(showSnackBar);
  }

  FutureOr<void> counterValueIncrementEvent(
      CounterValueIncrementEvent event, Emitter<CounterState> emit) {
    count += 1;
    emit(CounterValueIncrementState());
  }

  FutureOr<void> showSnackBar(
      ShowSnackBarEvent event, Emitter<CounterState> emit) {
    emit(ShowSnackBarState());
  }
}
