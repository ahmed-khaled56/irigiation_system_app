import 'package:irrigiation_app/models/control_model.dart';

class GetControlStates {}

class beforeStatrt extends GetControlStates {}

class GetIrrigationSuccessfullSatate extends GetControlStates {
  final ControlModel controlModel;

  GetIrrigationSuccessfullSatate({required this.controlModel});
}

class GetIrrigationfailureSatate extends GetControlStates {
  final String errMessage;

  GetIrrigationfailureSatate({required this.errMessage});
}
