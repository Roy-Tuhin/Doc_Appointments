class Data {
  final int doctorId;
  final int encDoctorId;

  Data({required this.doctorId, required this.encDoctorId});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      doctorId: json['DoctorId'],
      encDoctorId: json['DoctorId'],
    );
  }
}
