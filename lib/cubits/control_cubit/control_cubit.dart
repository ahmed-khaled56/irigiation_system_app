import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irrigiation_app/cubits/control_cubit/control_states.dart';
import 'package:irrigiation_app/models/control_model.dart';
import 'package:irrigiation_app/services/control_service.dart';

class StrartIrrigationCubit extends Cubit<GetControlStates> {
  StrartIrrigationCubit() : super(beforeStatrt());

  getControltSatus() async {
    try {
      final ControlModel data = await getControlStatus().getStatus();

      emit(GetIrrigationSuccessfullSatate(controlModel: data));
    } catch (e) {
      emit(GetIrrigationfailureSatate(errMessage: e.toString()));
    }
  }
}
