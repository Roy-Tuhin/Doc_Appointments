
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medbo/models/healthChkupDetailsModel.dart';

class HlthChkUpDetails extends StatefulWidget {

  final String encId;
  HlthChkUpDetails({required this.encId});
  @override
  _HlthChkUpDetailsState createState() => _HlthChkUpDetailsState();
}

class _HlthChkUpDetailsState extends State<HlthChkUpDetails> {

  static String url="http://medbo.digitalicon.in/api/medboapi/healthdetails";
  Dio dio = Dio();

  HealthData _healthData= HealthData(
      healthPartnerId: '',
      encHealthPartnerId: '',
      healthName: '',
      note: '',
      createBy: '',
      createDate: '',
      activeStatus: '',
      fee: '',
      discountedFee: '',
      bookingFee: '',
      testId: '',
      testName: ''
  );

  late List<PartnerDatum> hlthPartnerData = [];
  late List<PartnerDatum> _finalhlthpartnerData = [];
  @override
  void initState() {
    super.initState();
    getDocDetails(widget.encId);
  }
  Future getDocDetails(id) async{
    dynamic data={"EncId": id};
    print(id);
    Response res = await dio.post(url, data: data);

    print(res.data);
    if (res.statusCode == 200) {
      print('loop starts');

      HealthData data=HealthData(
          healthPartnerId: res.data['HealthData']['HealthPartnerId'],
          encHealthPartnerId:res.data['HealthData']['EncHealthPartnerId'],
          healthName:res.data['HealthData']['HealthName'],
          note:res.data['HealthData']['Note'],
          createBy:res.data['HealthData']['CreateBy'],
          createDate: res.data['HealthData']['CreateDate'],
          activeStatus:res.data['HealthData']['ActiveStatus'],
          fee:res.data['HealthData']['Fee'],
          discountedFee:res.data['HealthData']['DiscountedFee'],
          bookingFee:res.data['HealthData']['BookingFee'],
          testId: res.data['HealthData']['TestId'],
          testName:res.data['HealthData']['TestName'],
      );

      var k = res.data['PartnerData'].length;

      print('Loop for partner data');
      PartnerDatum obj;
      for (var i = 0; i < k; i++) {
        obj =PartnerDatum(
          partnerId: res.data['PartnerData'][i]['PartnerId'],
          encPartnerId: res.data['PartnerData'][i]['EncPartnerId'],
          partnerName: res.data['PartnerData'][i]['PartnerName'],
          partnerAddress: res.data['PartnerData'][i]['PartnerAddress'],
          fee:res.data['PartnerData'][i]['Fee'],
          discountedFee: res.data['PartnerData'][i]['DiscountedFee'],
          bookingFee: res.data['PartnerData'][i]['BookingFee'],
          dayList: res.data['PartnerData'][i]['DayList'],
        );
        hlthPartnerData.add(obj);

      }
      setState(() {
        _healthData=data;
        _finalhlthpartnerData=hlthPartnerData;
        // _docData=doctorData;
        // _partnerData=;
      });
    } else {
      print(res.statusCode);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_healthData.healthName} details', style: TextStyle(fontFamily: 'Roboto_Condensed'),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Theme
                    .of(context)
                    .primaryColor,
                Theme
                    .of(context)
                    .accentColor
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(

        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.lightBlue[50],
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [

                Container(
                  // height: 250,
                  // width: 200,
                  // color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                        child: Text(_healthData.healthName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Theme.of(context).primaryColor,fontFamily: 'Roboto_Condensed',),),
                      ),

                      Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [
                                Theme.of(context).primaryColor,
                                Theme.of(context).accentColor
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text('Test Name:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color:Colors.white,fontFamily: 'Roboto_Condensed',),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(_healthData.testName,style: TextStyle(fontSize: 17,color:Colors.white,fontFamily: 'Roboto_Condensed',),),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),

                Container(
                  // height: 500,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    // color: Colors.green,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:
                  Container(
                    height: 250,
                    // color: Colors.blue,
                    child: ListView.separated(
                      itemCount: hlthPartnerData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          Column(
                            children: [
                              Container(
                                // color: Colors.green,
                                height: 200,
                                width: 300,
                                // margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  // color: Colors.green,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.center,
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      Theme.of(context).accentColor
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(hlthPartnerData[index].partnerName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,fontFamily: 'Roboto_Condensed',),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(hlthPartnerData[index].partnerAddress,style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Roboto_Condensed',),),
                                    ),
                                    SizedBox(height:10),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Actual Fee: ${hlthPartnerData[index].fee}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Roboto_Condensed',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Discount Fee: ${hlthPartnerData[index].discountedFee}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Roboto_Condensed',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Booking Fee: ${hlthPartnerData[index].bookingFee}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Roboto_Condensed',
                                        ),
                                      ),
                                    ),

                                    Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 280,
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white
                                      ),
                                      child: Text('BOOK',style: TextStyle(color:Theme.of(context).primaryColor ),),
                                    ),
                                  ],
                                ),

                              ),

                            ],
                          ),
                      separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        color: Colors.transparent,
                        // height: 5,
                      ),
                    ),
                  ),

                ),

              ],
            ),
          ),


        ],
      ),


    );
  }
}
