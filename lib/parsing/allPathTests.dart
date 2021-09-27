// import 'dart:convert';
import 'package:medbo/models/allPathTestModel.dart';
import 'package:dio/dio.dart';




class PathTestList {
  static const String url =
      'https://medbo.in/api/medboapi/allpathologicaltest';
  Dio dio = Dio();

  Future<List<Datum>> getPathTest() async {
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
          // print(response.data['Data']);
          // print('Doctor Id for doctor {$i} :'+response.data['Data'][i]['DoctorId']);
          obj = Datum(
            testId: response.data['Data'][i]['TestId'],
            encTestId: response.data['Data'][i]['EncTestId'],
            testName: response.data['Data'][i]['TestName'],
            noOfPartner: response.data['Data'][i]['NoOfPartner'],
            testFee: response.data['Data'][i]['TestFee'],
            discountedFee: response.data['Data'][i]['DiscountedFee'],
            bookingFee: response.data['Data'][i]['BookingFee'],
            reportTime: response.data['Data'][i]['ReportTime'],
            note: response.data['Data'][i]['Note'],
            createBy: response.data['Data'][i]['CreateBy'],
            createDate: response.data['Data'][i]['CreateDate'],
            modBy: response.data['Data'][i]['ModBy'],
            modDate: response.data['Data'][i]['ModDate'],
            activeStatus: response.data['Data'][i]['ActiveStatus'],
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

