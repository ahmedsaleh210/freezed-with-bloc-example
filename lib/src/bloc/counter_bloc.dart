import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.freezed.dart';

class CounterBloc extends Bloc<BlocEvent, CounterState> {
  CounterBloc() : super(const _Initial()) {
    on<CounterEvent>(
      (event, emit) {
        event.map(
            increment: (Increment event) => _increment(event, emit),
            testError: (_) => _testError(emit));
      },
    );
  }

  void _increment(Increment event, Emitter<CounterState> emit) {
    log(event.text); //just for test value of text
    emit(state.copyWith(
      status: CounterStatus.success,
      count: state.count + 1,
    ));
  }

  void _testError(Emitter<CounterState> emit) {
    emit(state.copyWith(
      status: CounterStatus.error,
      count: state.count,
    ));
  }
}
