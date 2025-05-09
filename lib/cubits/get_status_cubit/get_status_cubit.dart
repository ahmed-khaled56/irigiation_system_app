import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irrigiation_app/cubits/get_status_cubit/get_status_states.dart';
import 'package:irrigiation_app/models/status_model.dart';
import 'package:irrigiation_app/services/status_service.dart';

//StatusResponseModel? statusModel;

// class GetStatusCubit extends Cubit<StatusStates> {
//   GetStatusCubit() : super(NoStatusState());

//   etStatus() async {
//     List<StatusModel> statusList = [];

//     try {
//       statusList = await GetStatus().getstatus();

//       emit(StatusLoadedSuccessfullSatate(statusModel: statusList));
//     } catch (e) {
//       emit(StatusFailureSatate(errMessage: e.toString()));
//     }
//   }
// }

class GetStatusCubit extends Cubit<StatusStates> {
  GetStatusCubit() : super(NoStatusState());

  final StreamController<StatusResponseModel> _statusController =
      StreamController.broadcast();

  Stream<StatusResponseModel> get statusStream => _statusController.stream;

  Future<void> getStatus() async {
    try {
      final status = await GetStatus().getStatus(); // يرجع كائن مفرد
      _statusController.add(status); // بث البيانات عبر الستريم
      emit(StatusLoadedSuccessfullSatate(statusModel: status));
    } catch (e) {
      _statusController.addError(e);
      emit(StatusFailureSatate(errMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _statusController.close();
    return super.close();
  }
}
