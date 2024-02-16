
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/kuisoner_remote_datasource.dart';
import '../../../../data/models/response/question_response_model.dart';

part 'detail_event.dart';
part 'detail_state.dart';
part 'detail_bloc.freezed.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final KuisonerRemoteDatasource _kuisonerRemoteDatasource;
  DetailBloc(this._kuisonerRemoteDatasource) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const DetailState.loading());
      final response = await _kuisonerRemoteDatasource.getList();

      response.fold((l) => emit(DetailState.error(l)), (r) {
        emit(DetailState.success(r.data[0]));
      });
    });
  }
}
