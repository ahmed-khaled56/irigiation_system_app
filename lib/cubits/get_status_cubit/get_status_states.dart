import 'package:irrigiation_app/models/status_model.dart';

class StatusStates {}

class NoStatusState extends StatusStates {}

class StatusLoadedSuccessfullSatate extends StatusStates {
  final StatusResponseModel statusModel;

  StatusLoadedSuccessfullSatate({required this.statusModel});
}

class StatusFailureSatate extends StatusStates {
  final String errMessage;

  StatusFailureSatate({required this.errMessage});
  // factory StatusFailureSatate({required String errMessage});
  //   throw Exception('This is a generic exception,$errMessage');
  // }
}
