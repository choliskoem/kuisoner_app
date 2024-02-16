part of 'list_bloc.dart';

@freezed
class ListEvent with _$ListEvent {
  const factory ListEvent.started() = _Started;
  const factory ListEvent.fetch() = _Fetch;
}