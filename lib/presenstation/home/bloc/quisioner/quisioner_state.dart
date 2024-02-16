part of 'quisioner_bloc.dart';

@freezed
class QuisionerState with _$QuisionerState {
  const factory QuisionerState.initial() = _Initial;
  const factory QuisionerState.loading() = _Loading;
  const factory QuisionerState.success( List<Datum> datum) = _Success;
    const factory QuisionerState.error(String message) = _Error;
}
