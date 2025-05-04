class ControlModel {
  final String message;
  final int? code;
  final List<dynamic>? errors;
  final List<dynamic>? data;

  ControlModel({required this.message, this.code, this.errors, this.data});

  factory ControlModel.fromJson(json) {
    return ControlModel(
      message: json['message'],
      code: json['code'],
      errors: json['errors'],
      data: json['data'],
    );
  }
}
