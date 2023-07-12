part of 'counter_bloc.dart';
enum CounterStatus { initial, success, error }


@freezed
class CounterState with _$CounterState {
   const factory CounterState({
    @Default(CounterStatus.initial) CounterStatus status,
    @Default(0) int count,
  }) = _Initial;
}
