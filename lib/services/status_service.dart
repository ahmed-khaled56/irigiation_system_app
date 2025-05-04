// class StatusService {
//   final Dio dio;

//   StatusService(this.dio);

//   Future<StatusModel> checkIrrigationStatus() async {
//     try {
//       final response = await dio.post(
//         'https://abcdef1234.ngrok.io/api/check-irrigation', // Replace with your ngrok URL
//         options: Options(headers: {'Content-Type': 'application/json'}),
//       );
//       StatusModel statusModel = StatusModel.fromJson(jsonDecode(response.data));
//       return statusModel;
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
import 'package:irrigiation_app/models/status_model.dart';

// class GetStatus {
//   Future<List<StatusModel>> getstatus() async {
//     List<dynamic> data = await API().get(
//       url: 'https://88bb-196-128-10-0.ngrok-free.app/api',
//     );

//     List<StatusModel> productsList = [];

//     for (int i = 0; i < data.length; i++) {
//       productsList.add(StatusModel.fromJson(data[i]));
//     }

//     return productsList;
//   }
// }
class GetStatus {
  Future<Map<String, StatusResponseModel>> getstatus() async {
    Map<String, dynamic> data = await API().get(
      url: 'https://88bb-196-128-10-0.ngrok-free.api',
    );

    Map<String, StatusResponseModel> productsMap = {};

    data.forEach((key, value) {
      productsMap[key] = StatusResponseModel.fromJson(value);
    });

    return productsMap;
  }
}
