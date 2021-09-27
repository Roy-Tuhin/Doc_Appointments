// import 'dart:convert';
import 'package:medbo/models/allSurgicalPackModels.dart';
import 'package:dio/dio.dart';



class AllSurgPackList {
  static const String url =
      'https://medbo.in/api/medboapi/allsurgicalpackage';
  Dio dio = Dio();

  Future<List<Data>> getSPList() async {
    late List<Data> surglist=[];
    var i;
    try {
      Response response = await resp();
      if (response.statusCode == 200) {
        print("loop run");
        var k = response.data['Data'].length;
        // print(k);
        // print(response.data['Data'][4]['DoctorId']);
        Data obj;
        for (i = 0; i < k; i++) {
          // print(response.data['Data']);
          // print('Doctor Id for doctor {$i} :'+response.data['Data'][i]['DoctorId']);
          obj = Data(
            packageId: response.data['Data'][i]['PackageId'],
            encPackageId: response.data['Data'][i]['EncPackageId'],
            packageName: response.data['Data'][i]['PackageName'],
            note: response.data['Data'][i]['Note'],
            createBy: response.data['Data'][i]['CreateBy'],
            createDate: response.data['Data'][i]['CreateDate'],
            modBy: response.data['Data'][i]['ModBy'],
            modDate: response.data['Data'][i]['ModDate'],
            activeStatus: response.data['Data'][i]['ActiveStatus'],
            permission: response.data['Data'][i]['Permission'],
            fee: response.data['Data'][i]['Fee'],
            discountedFee: response.data['Data'][i]['DiscountedFee'],
            bookingFee: response.data['Data'][i]['BookingFee'],
            description: response.data['Data'][i]['Description'],

          );
          surglist.add(obj);
          // print(_datum);
        }
        // print(_datum);
      }
    }catch (e){
      print("Error occured: {$e}");
    }
    return surglist;
  }

  Future<Response> resp() async {
    Response response = await dio.post(url);
    return response;
  }
}

