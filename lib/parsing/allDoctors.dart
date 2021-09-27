// import 'dart:convert';
import 'package:medbo/models/allDoctorsModel.dart';
import 'package:dio/dio.dart';



class AllDoctorsList {
  static const String url =
      'https://medbo.in/api/medboapi/alldoctor';
  Dio dio = Dio();

  Future<List<Datum>> getDocs() async {//======================= fetchData
    late List<Datum> _datum=[];
    var i;
    try {
    Response response = await resp();
    if (response.statusCode == 200) {
      // print(response.data.toString().split('/'));
      // print(response.data['Status']);
      print("loop for doctor list run");
      var k = response.data['Data'].length;
      // print(k);
      // print(response.data['Data'][4]['DoctorId']);
      Datum obj;
      for (i = 0; i < k; i++)
      {
        // print(response.data['Data']);
        // print('Doctor Id for doctor {$i} :'+response.data['Data'][i]['DoctorId']);
        obj = Datum(
          doctorId: response.data['Data'][i]['DoctorId'],
          encDoctorId: response.data['Data'][i]['EncDoctorId'],
          doctorName: response.data['Data'][i]['DoctorName'],
          doctorImage: response.data['Data'][i]['DoctorImage'],
          linkPartner: response.data['Data'][i]['LinkPartner'],
          specialisation: response.data['Data'][i]['Specialisation'],
          gender: response.data['Data'][i]['Gender'],
          qualification: response.data['Data'][i]['Qualification'],
          fee: response.data['Data'][i]['Fee'],
          discountedFee: response.data['Data'][i]['DiscountFee'],
          bookingFee: response.data['Data'][i]['BookingFee'],
          timeFrom: response.data['Data'][i]['TimeFrom'],
          timeTo: response.data['Data'][i]['TimeTo'],
          visitDay: response.data['Data'][i]['VisitDay'],
          phone: response.data['Data'][i]['Phone'],
          alternatePhone: response.data['Data'][i]['AlternatePhone'],
          email: response.data['Data'][i]['Email'],
          note: response.data['Data'][i]['Note'],
          createBy: response.data['Data'][i]['CreatedBy'],
          createDate: response.data['Data'][i]['CreateDate'],
          modBy: response.data['Data'][i]['ModBy'],
          modDate: response.data['Data'][i]['ModDate'],
          activeStatus: response.data['Data'][i]['ActivityStatus'],
          permission: response.data['Data'][i]['Permission'],
        );
        _datum.add(obj);
        // print(_datum);
      }
      // print(_datum);
    }
    }catch (e){
      print("Error occured: {$e}");
    }
    return _datum;
  }

  Future<Response> resp() async {
    Response response = await dio.post(url);
    return response;
  }
}

