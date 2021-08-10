class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({required this.token, required this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  // ignore: non_constant_identifier_names
  String LoginId;
  // ignore: non_constant_identifier_names
  String Password;

  LoginRequestModel({
    required this.LoginId,
    required this.Password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'LoginId': LoginId.trim(),
      'Password': Password.trim(),
    };

    return map;
  }
}
