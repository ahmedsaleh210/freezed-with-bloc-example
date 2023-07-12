part of 'counter_bloc.dart';
sealed class BlocEvent {}

@freezed
class CounterEvent extends BlocEvent with _$CounterEvent {
  const factory CounterEvent.increment({required String text}) = Increment;
  const factory CounterEvent.testError() = _TestError;
}