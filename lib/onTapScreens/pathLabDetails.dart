

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:medbo/models/pathTestDetailsModel.dart';

class PathTestDetails extends StatefulWidget {
  final String encId;
  PathTestDetails({this.encId='U4exk+vfMGrn7cjNUa/PBw=='});
  @override
  _PathTestDetailsState createState() => _PathTestDetailsState();
}

class _PathTestDetailsState extends State<PathTestDetails> {

  static String url="http://medbo.digitalicon.in/api/medboapi/pathologicaltestdetails";
  Dio dio = Dio();
  TestData _pathTestData=TestData(
      testId: '',
      encTestId: '',
      testName: '',
      noOfPartner: '',
      testFee: '',
      discountedFee: '',
      bookingFee: '',
      reportTime: '',
      note: '',
      createBy: '',
      createDate: '',
      modBy: '',
      modDate: '',
      activeStatus: '',
      permission: ''
  );

  late List<PartnerDatum> pathPartnerData = [];
  late List<PartnerDatum> _finalpathpartnerData = [];

  @override
  void initState() {
    super.initState();
    getPathLabDetails(widget.encId);
  }
  Future getPathLabDetails(id) async{
    dynamic data={"EncId": id};
    print(id);
    Response res = await dio.post(url, data: data);

    print(res.data);
    if (res.statusCode == 200) {
      print('loop starts');

      TestData testData=TestData(
          testId: res.data['TestData']['TestId'],
          encTestId: res.data['TestData']['EncTestId'],
          testName: res.data['TestData']['TestName'],
          noOfPartner: res.data['TestData']['NoOfPartner'],
          testFee: res.data['TestData']['TestFee'],
          discountedFee: res.data['TestData']['DiscountedFee'],
          bookingFee: res.data['TestData']['BookingFee'],
          reportTime: res.data['TestData']['ReportTime'],
          note: res.data['TestData']['Note'],
          createBy: res.data['TestData']['CreateBy'],
          createDate: res.data['TestData']['CreateDate'],
          modBy: res.data['TestData']['ModBy'],
          modDate: res.data['TestData']['ModDate'],
          activeStatus: res.data['TestData']['ActiveStatus'],
          permission: res.data['TestData']['Permission']
      );
      var k = res.data['PartnerData'].length;
      PartnerDatum obj;
     for(var i=0;i<k;i++){
       obj=PartnerDatum(
         partnerId: res.data['PartnerData'][i]['PartnerId'],
         encPartnerId: res.data['PartnerData'][i]['EncPartnerId'],
         partnerName: res.data['PartnerData'][i]['PartnerName'],
         partnerAddress: res.data['PartnerData'][i]['PartnerAddress'],
         fee:res.data['PartnerData'][i]['Fee'],
         discountedFee: res.data['PartnerData'][i]['DiscountedFee'],
         bookingFee: res.data['PartnerData'][i]['BookingFee'],
         dayList: res.data['PartnerData'][i]['DayList'],
       );
       pathPartnerData.add(obj);
     }
      setState(() {
        _pathTestData=testData;
        _finalpathpartnerData=pathPartnerData;
      });


    } else {
      print(res.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_pathTestData.testName} details', style: TextStyle(fontFamily: 'Roboto_Condensed'),),
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

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                  child: Text(_pathTestData.testName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Theme.of(context).primaryColor,fontFamily: 'Roboto_Condensed',),),
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
                      itemCount: pathPartnerData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          Column(
                            children: [
                              Container(
                                // color: Colors.green,
                                height: 200,
                                width: 300,
                                margin: EdgeInsets.only(right: 20),
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
                                      child: Text(pathPartnerData[index].partnerName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,fontFamily: 'Roboto_Condensed',),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(pathPartnerData[index].partnerAddress,style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Roboto_Condensed',),),
                                    ),
                                    SizedBox(height:10),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Actual Fee: ${pathPartnerData[index].fee}',
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
                                        'Discount Fee: ${pathPartnerData[index].discountedFee}',
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
                                        'Booking Fee: ${pathPartnerData[index].bookingFee}',
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
                        height: 5,
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
