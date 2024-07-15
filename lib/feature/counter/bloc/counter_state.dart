part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class CounterValueIncrementState extends CounterState {}

abstract class CounterActionState extends CounterState{}

class ShowSnackBarState extends CounterActionState{}