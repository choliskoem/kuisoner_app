// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:kusioner_ung/data/datasources/kuisoner_remote_datasource.dart';
import 'package:kusioner_ung/data/models/response/question_response_model.dart';

part 'quisoner_bloc.freezed.dart';
part 'quisoner_event.dart';
part 'quisoner_state.dart';

class QuisonerBloc extends Bloc<QuisonerEvent, QuisonerState> {
  final KuisonerRemoteDatasource _kuisonerRemoteDatasource;
  List<Datum> products = [];
  QuisonerBloc(this._kuisonerRemoteDatasource) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      try {
        emit(const QuisonerState.loading());
        final response = await _kuisonerRemoteDatasource.getList();
        response.fold(
          (l) => emit(
            QuisonerState.error(l),
          ),
          (r) {
            products = r.data;

            emit(QuisonerState.success(r.data));
          },
        );
      } catch (e) {
        emit(const QuisonerState.connection());
      }
    });
  }
}
