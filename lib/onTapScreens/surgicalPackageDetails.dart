
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medbo/Booking/SurgicalPackBooking.dart';
import 'package:medbo/models/surgPackDetailsModel.dart';

class SurgPackDetails extends StatefulWidget {

  final String encId;
  SurgPackDetails({this.encId='IujyQXg8KZg8asLvK/FS7g=='});
  @override
  _SurgPackDetailsState createState() => _SurgPackDetailsState();
}

class _SurgPackDetailsState extends State<SurgPackDetails> {

  static String url="http://medbo.digitalicon.in/api/medboapi/surgicaldetails";
  Dio dio = Dio();

  SurgicalData _surgicalData=SurgicalData(
    packageId: '', 
    encPackageId: '',
      packageName: '', 
      note: '',
       createBy: '',
        createDate: '',
      modBy: '',
       modDate: '',
        activeStatus: '',
         permission: '',
      fee: '', 
      discountedFee: '',
       bookingFee: '',
      description: '');

  late List<PartnerDatum> surgPartnerData = [];
  late List<PartnerDatum> _finalsurgpartnerData = [];
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

      SurgicalData surgdata=SurgicalData(
          packageId: res.data['SurgicalData']['PackageId'],
          encPackageId: res.data['SurgicalData']['EncPackageId'],
          packageName: res.data['SurgicalData']['PackageName'],
          note: res.data['SurgicalData']['Note'],
          createBy: res.data['SurgicalData']['CreateBy'],
          createDate: res.data['SurgicalData']['CreateDate'],
          modBy: res.data['SurgicalData']['ModBy'],
          modDate: res.data['SurgicalData']['ModDate'],
          activeStatus: res.data['SurgicalData']['ActiveStatus'],
          permission: res.data['SurgicalData']['Permission'],
          fee: res.data['SurgicalData']['Fee'],
          discountedFee: res.data['SurgicalData']['DiscountedFee'],
          bookingFee: res.data['SurgicalData']['BookingFee'],
          description:res.data['SurgicalData']['Description'],
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
        surgPartnerData.add(obj);

        }
      setState(() {
        _surgicalData=surgdata;
        _finalsurgpartnerData=surgPartnerData;
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
        title: Text('${_surgicalData.packageName} details', style: TextStyle(fontFamily: 'Roboto_Condensed'),),
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

                      Padding(//===================================================================================================================================================================================
                        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                        child: Text(_surgicalData.packageName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Theme.of(context).primaryColor,fontFamily: 'Roboto_Condensed',),),
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
                                child: Text('Description:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color:Colors.white,fontFamily: 'Roboto_Condensed',),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(_surgicalData.description,style: TextStyle(fontSize: 17,color:Colors.white,fontFamily: 'Roboto_Condensed',),),
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
                      itemCount: surgPartnerData.length,
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
                                      child: Text(surgPartnerData[index].partnerName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,fontFamily: 'Roboto_Condensed',),),
                                    ),
                                    Padding(//=======================================================================================================================================================================================================
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(surgPartnerData[index].partnerAddress,style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Roboto_Condensed',),),
                                    ),
                                    SizedBox(height:10),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Actual Fee: ${surgPartnerData[index].fee}',
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
                                        'Discount Fee: ${surgPartnerData[index].discountedFee}',
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
                                        'Booking Fee: ${surgPartnerData[index].bookingFee}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Roboto_Condensed',
                                        ),
                                      ),
                                    ),

                                    InkWell(
                                      onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => SurgicalPackBooking(_surgicalData, surgPartnerData[index])
                                                          ));
                                            },
                                      child: Container(
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
