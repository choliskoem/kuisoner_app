// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:kusioner_ung/data/datasources/kuisoner_remote_datasource.dart';

import '../../../../data/models/response/question_response_model.dart';

part 'quisioner_bloc.freezed.dart';
part 'quisioner_event.dart';
part 'quisioner_state.dart';

class QuisionerBloc extends Bloc<QuisionerEvent, QuisionerState> {
  final KuisonerRemoteDatasource _kuisonerRemoteDatasource;
  List<Datum> datum = [];
  QuisionerBloc(
    this._kuisonerRemoteDatasource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const QuisionerState.loading());
      final response = await _kuisonerRemoteDatasource.getList();
      
      response.fold((l) => emit(QuisionerState.error(l)), (r) {
        datum = r.data;
        emit(QuisionerState.success(r.data));
      });
    });
  }
}
