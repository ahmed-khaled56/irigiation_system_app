// class StatusModel {
//   final String? Temp;
//   final String? SoilTemp;
//   final String? Humdity;

//   StatusModel({
//     required this.Temp,
//     required this.SoilTemp,
//     required this.Humdity,
//   });

//   factory StatusModel.fromJson(jsondata) {
//     return StatusModel(
//       Temp: jsondata['temperature'],
//       SoilTemp: jsondata['soil_temperature'],
//       Humdity: jsondata['soil_moisture'],
//     );
//   }
// }
class StatusDataModel {
  final String soilMoisture;
  final String soilTemperature;
  final bool irrigation;
  final String createdAt;
  final String updatedAt;
  final String temperature;

  StatusDataModel({
    required this.soilMoisture,
    required this.soilTemperature,
    required this.irrigation,
    required this.createdAt,
    required this.updatedAt,
    required this.temperature,
  });

  factory StatusDataModel.fromJson(json) {
    return StatusDataModel(
      soilMoisture: json['soil_moisture'] ?? '',
      soilTemperature: json['soil_temperature'] ?? '',
      irrigation: json['irrigation'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      temperature: json['temperature'] ?? '',
    );
  }
}

class StatusResponseModel {
  final String message;
  final List<dynamic> errors;
  final StatusDataModel data;

  StatusResponseModel({
    required this.message,
    required this.errors,
    required this.data,
  });

  factory StatusResponseModel.fromJson(Map<String, dynamic> json) {
    return StatusResponseModel(
      message: json['message'] ?? '',
      errors: json['errors'] ?? [],
      data: StatusDataModel.fromJson(json['data']),
    );
  }
}
