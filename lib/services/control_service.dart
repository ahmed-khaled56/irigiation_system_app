// class ControlService {
//   final Dio dio;

//   ControlService(this.dio);

//   Future<ControlModel> startIrrigation() async {
//     try {
//       final response = await dio.post(
//         'https://abcdef1234.ngrok.io/api/irrigate', // Replace with your ngrok URL
//         options: Options(headers: {'Content-Type': 'application/json'}),
//       );
//       ControlModel controlModel =
//           ControlModel.fromJson(jsonDecode(response.data));
//       return controlModel;
//     } on DioException catch (e) {
//       final String errorMessage = e.response?.data['error']['message'] ??
//           'oops Something went wrong, try leter';

//       throw Exception(errorMessage);
//     } catch (e) {
//       log(e.toString());
//       throw Exception('oops Something went wrong, try leter');
//     }
//   }
// }

import 'package:irrigiation_app/helpers/API.dart';
import 'package:irrigiation_app/models/control_model.dart';

// class getControlStatus {
//   Future<List<dynamic>> getstatus() async {
//     List<dynamic> data = await API().post(
//       url: 'https://88bb-196-128-10-0.ngrok-free.app/api',
//     );

//     return data;
//   }
// }

class getControlStatus {
  Future<ControlModel> getStatus() async {
    Map<String, dynamic> data = await API().post(
      url: 'https://88bb-196-128-10-0.ngrok-free.app/api',
    );

    return ControlModel.fromJson(data);
  }
}
