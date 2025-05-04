import 'package:irrigiation_app/models/status_model.dart';

class StatusStates {}

class NoStatusState extends StatusStates {}

class StatusLoadedSuccessfullSatate extends StatusStates {
  final Map<String, StatusResponseModel> statusMap;

  StatusLoadedSuccessfullSatate({required this.statusMap});
}

class StatusFailureSatate extends StatusStates {
  final String errMessage;

  StatusFailureSatate({required this.errMessage});
}
