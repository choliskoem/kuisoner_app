part of 'quisoner_bloc.dart';

@freezed
class QuisonerState with _$QuisonerState {
  const factory QuisonerState.initial() = _Initial;
  const factory QuisonerState.loading() = _Loading;

  const factory QuisonerState.success(List<Datum> datum) = _Success;

  const factory QuisonerState.error(String message) = _Error;
    const factory QuisonerState.connection() = _Connection;
}
