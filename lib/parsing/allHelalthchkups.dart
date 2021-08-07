// import 'dart:convert';
import 'package:medbo/models/allHealthchkupModel.dart';
import 'package:dio/dio.dart';




class HlthChkUpList {
  static const String url =
      'http://medbo.digitalicon.in/api/medboapi/allhealthckeckup';
  Dio dio = Dio();

  Future<List<Datum>> getHlthChkUps() async {
    List<Datum> _datum=[];
    // var i;
    try {
      Response response = await resp();
      if (response.statusCode == 200) {
        print("loop run");
        var k = response.data['Data'].length;
        // print(k);
        // print(response.data['Data'][4]['DoctorId']);
        Datum obj;
        for (var i = 0; i < k; i++) {
          print(response.data['Data']);
          // print('HealthCareId Id {$i} :'+response.data['Data'][i]['DoctorId']);
          obj = Datum(
            healthPartnerId: response.data['Data'][i]['HealthPartnerId'],
            encHealthPartnerId: response.data['Data'][i]['EncHealthPartnerId'],
            healthName: response.data['Data'][i]['HealthName'],
            note: response.data['Data'][i]['Note'],
            createBy: response.data['Data'][i]['CreateBy'],
            createDate: response.data['Data'][i]['CreateDate'],
            activeStatus: response.data['Data'][i]['ActiveStatus'],
            fee: response.data['Data'][i]['Fee'],
            discountedFee: response.data['Data'][i]['DiscountedFee'],
            bookingFee: response.data['Data'][i]['BookingFee'],
            testId: response.data['Data'][i]['TestId'],
            testName: response.data['Data'][i]['TestName'],
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

