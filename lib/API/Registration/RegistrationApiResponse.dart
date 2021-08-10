//



class RegistrationApiResponse {
    RegistrationApiResponse({
        required this.status,
        required this.message,
        required this.userData,
    });

    String status;
    String message;
    //UserData userData;
    UserData? userData;

    factory RegistrationApiResponse.fromJson(Map<String, dynamic> json) => RegistrationApiResponse(
        status: json["Status"],
        message: json["Message"],
        //userData: UserData.fromJson(json["UserData"]),
         userData: json["UserData"] == null? null:UserData.fromJson(json["UserData"] as Map<String, dynamic>),
        //userData: json["UserData"] == null? null:UserData.fromJson(json["UserData"]), //======== Updated
       // userData: json["UserData"] == null? null:UserData.fromJson(json["UserData"]) as Map<String, dynamic>,
    );


}

class UserData {
    UserData({
        required this.name,
        required this.encUserId,
    });

    String name;
    String encUserId;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json["Name"],
        encUserId: json["EncUserId"],
    );

}