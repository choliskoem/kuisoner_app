part of 'quisioner_bloc.dart';

@freezed
class QuisionerEvent with _$QuisionerEvent {
  const factory QuisionerEvent.started() = _Started;
    const factory QuisionerEvent.fetch() = _Fetch;
}