
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kusioner_ung/data/models/response/question_response_model.dart';

import '../../../../data/datasources/kuisoner_remote_datasource.dart';

part 'list_event.dart';
part 'list_state.dart';
part 'list_bloc.freezed.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final KuisonerRemoteDatasource _kuisonerRemoteDatasource;
  List<Datum> category = [];

  ListBloc(this._kuisonerRemoteDatasource) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const ListState.loading());
      final response = await _kuisonerRemoteDatasource.getList();

      response.fold((l) => emit(ListState.error(l)), (r) {
        category = r.data;

        emit(ListState.success(r.data));
      });
    });
  }
}
