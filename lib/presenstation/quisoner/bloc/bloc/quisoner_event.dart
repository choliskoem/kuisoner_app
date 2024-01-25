part of 'quisoner_bloc.dart';

@freezed
class QuisonerEvent with _$QuisonerEvent {
  const factory QuisonerEvent.started() = _Started;
  const factory QuisonerEvent.fetch() = _Fetch;
}
