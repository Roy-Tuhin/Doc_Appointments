import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:medbo/Booking/DocBooking.dart';
import 'package:medbo/models/docDetailsModel.dart';

// import 'package:url_launcher/url_launcher.dart';
class DoctorDetails extends StatefulWidget {
  final String encId;
  DoctorDetails({this.encId = 'fXVmzecGStqrhx1PmIgwlQ=='});
  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  static String url = "http://medbo.digitalicon.in/api/medboapi/doctdetails";
  Dio dio = Dio();
  DoctorData _docData = DoctorData(
      doctorId: '',
      encDoctorId: '',
      doctorName: '',
      doctorImage: '',
      linkPartner: '',
      specialisation: '',
      gender: '',
      qualification: '',
      fee: '',
      discountedFee: '',
      bookingFee: '',
      timeFrom: '',
      timeTo: '',
      visitDay: '',
      phone: '',
      alternatePhone: '',
      email: '',
      note: '',
      createBy: '',
      createDate: '',
      modBy: '',
      modDate: '',
      activeStatus: '',
      permission: '');

  late List<PartnerDatum> partnerData = [];
  late List<PartnerDatum> _finalpartnerData = [];

  late List<DayList> docDayList = [];
  late List<DayList> finalDocDayList = [];

  @override
  void initState() {
    super.initState();
    getDocDetails(widget.encId);
    // getDocPartnerData(widget.encId);
  }

  Future getDocDetails(id) async {
    dynamic data = {"EncId": id};
    print(id);
    Response res = await dio.post(url, data: data);

    // print(res.data);
    print(res.data['DoctorData'].toString());
    // print(res.data['PartnerData'][0]['DayList']);
    if (res.statusCode == 200) {
      print('loop starts');

      DoctorData doctorData = DoctorData(
        doctorId: res.data['DoctorData']['DoctorId'],
        encDoctorId: res.data['DoctorData']['EncDoctorId'],
        doctorName: res.data['DoctorData']['DoctorName'],
        doctorImage: res.data['DoctorData']['DoctorImage'],
        linkPartner: res.data['DoctorData']['LinkPartner'],
        specialisation: res.data['DoctorData']['Specialisation'],
        gender: res.data['DoctorData']['Gender'],
        qualification: res.data['DoctorData']['Qualification'],
        fee: res.data['DoctorData']['Fee'],
        discountedFee: res.data['DoctorData']['DiscountedFee'],
        bookingFee: res.data['DoctorData']['BookingFee'],
        timeFrom: res.data['DoctorData']['TimeFrom'],
        timeTo: res.data['DoctorData']['TimeTo'],
        visitDay: res.data['DoctorData']['VisitDay'],
        phone: res.data['DoctorData']['Phone'],
        alternatePhone: res.data['DoctorData']['AlternatePhone'],
        email: res.data['DoctorData']['Email'],
        note: res.data['DoctorData']['Note'],
        createBy: res.data['DoctorData']['CreateBy'],
        createDate: res.data['DoctorData']['CreateDate'],
        modBy: res.data['DoctorData']['ModBy'],
        modDate: res.data['DoctorData']['ModDate'],
        activeStatus: res.data['DoctorData']['ActiveStatus'],
        permission: res.data['DoctorData']['Permission'],
      );

      print('Doctor data done');
      var k = res.data['PartnerData'].length;

      print('Loop for partner data');
      PartnerDatum obj;
      for (var i = 0; i < k; i++) {
        obj = PartnerDatum(
          partnerId: res.data['PartnerData'][i]['PartnerId'],
          encPartnerId: res.data['PartnerData'][i]['EncPartnerId'],
          partnerName: res.data['PartnerData'][i]['PartnerName'],
          partnerAddress: res.data['PartnerData'][i]['PartnerAddress'],
          fee: res.data['PartnerData'][i]['Fee'],
          discountedFee: res.data['PartnerData'][i]['DiscountedFee'],
          bookingFee: res.data['PartnerData'][i]['BookingFee'],
          dayList: List<DayList>.from((res.data['PartnerData'][i]['DayList'])
              .map((x) => DayList.fromJson(x))),
        );
        partnerData.add(obj);
        // var y=partnerData;
        var y = res.data['PartnerData'][i]['DayList'].length;
        print(y);
        DayList docDayListobj;
        for (var z = 0; z < y; z++) {
          docDayListobj = DayList(
              dayName: res.data['PartnerData'][i]['DayList'][z]['DayName'],
              timeFrom: res.data['PartnerData'][i]['DayList'][z]['TimeFrom'],
              timeTo: res.data['PartnerData'][i]['DayList'][z]['TimeTo']);
          docDayList.add(docDayListobj);
          print(partnerData[i].dayList[z].dayName);
        }
      }

      // for(var x=0;x<k;x++){
      //
      //   print(docDayList[y].dayName);
      // }

      setState(() {
        _docData = doctorData;
        _finalpartnerData = partnerData;
        finalDocDayList = docDayList;
      });
      // print(finalDocDayList);
      // print(doctorData.doctorName);
      // print(doctorData.specialisation);
      // print(obj.partnerName);
      // _doctorData

    } else {
      print(res.statusCode);
      // print(res.statusMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(fontFamily: 'Roboto_Condensed'),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.lightBlue[50],
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    // height: 100,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.green,
                    // margin: EdgeInsets.all(5),

                    child: Row(
                      children: [
                        Container(
                          height: 205,
                          width: 180,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: _docData.doctorImage.isEmpty
                              ? Center(child: const CircularProgressIndicator())
                              : Image.network(
                                  _docData
                                      .doctorImage, //==========================================================================================================================================
                                  fit: BoxFit.contain,
                                ),
                        ),
                        Container(
                          height: 205,
                          width: 160,
                          // color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 10),
                                child: Text(
                                  _docData
                                      .doctorName, //====================================================================================================
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Theme.of(context).primaryColor,
                                    fontFamily: 'Roboto_Condensed',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 10),
                                child: Text(
                                  _docData.qualification,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColor,
                                    fontFamily: 'Roboto_Condensed',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10),
                                child: Text(
                                  _docData.specialisation,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColor,
                                    fontFamily: 'Roboto_Condensed',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 390,
                          // color: Colors.blue,
                          child: ListView.separated(
                            itemCount: _finalpartnerData.length,
                            // _finalDocDayList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Column(
                              children: [
                                Container(
                                  // color: Colors.green,
                                  height: 190,
                                  width: 280,
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
                                    children: [
                                      Container(
                                        // height: 100,
                                        // padding: EdgeInsets.all(5),
                                        // color: Colors.green,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                //===========================================================================================================================
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    _finalpartnerData[index]
                                                        .partnerName,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'Roboto_Condensed',
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    _finalpartnerData[index]
                                                        .partnerAddress,
                                                    style: TextStyle(
                                                      // fontWeight: FontWeight.bold,
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'Roboto_Condensed',
                                                    ),
                                                  ),
                                                ),
                                              ], //================================================================================================================================
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // alignment: Alignment.center,
                                            // height: 40,
                                            // width: MediaQuery.of(context).size.width,
                                            margin: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              // color: Colors.white
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                partnerData[index]
                                                            .dayList
                                                            .length ==
                                                        1
                                                    ? Text(
                                                        '${partnerData[index].dayList[0].dayName} | Time from ${partnerData[index].dayList[0].timeFrom} Time to ${partnerData[index].dayList[0].timeTo}',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'Roboto_Condensed',
                                                            fontSize: 14),
                                                      )
                                                    : partnerData[index]
                                                                .dayList
                                                                .length ==
                                                            2
                                                        ? Column(
                                                            children: [
                                                              Text(
                                                                '${partnerData[index].dayList[0].dayName} | Time from ${partnerData[index].dayList[0].timeFrom} Time to ${partnerData[index].dayList[0].timeTo}',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'Roboto_Condensed',
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                              Text(
                                                                '${partnerData[index].dayList[1].dayName} | Time from ${partnerData[index].dayList[1].timeFrom} Time to ${partnerData[index].dayList[0].timeTo}',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'Roboto_Condensed',
                                                                    fontSize:
                                                                        14),
                                                              )
                                                            ],
                                                          )
                                                        : partnerData[index]
                                                                    .dayList
                                                                    .length ==
                                                                3
                                                            ? Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    '${partnerData[index].dayList[0].dayName} | Time from ${partnerData[index].dayList[0].timeFrom} Time to ${partnerData[index].dayList[0].timeTo}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'Roboto_Condensed',
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                  Text(
                                                                    '${partnerData[index].dayList[1].dayName} | Time from ${partnerData[index].dayList[1].timeFrom} Time to ${partnerData[index].dayList[1].timeTo}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'Roboto_Condensed',
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                  Text(
                                                                    '${partnerData[index].dayList[2].dayName} | Time from ${partnerData[index].dayList[2].timeFrom} Time to ${partnerData[index].dayList[2].timeTo}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'Roboto_Condensed',
                                                                        fontSize:
                                                                            14),
                                                                  )
                                                                ],
                                                              )
                                                            : partnerData[index]
                                                                        .dayList
                                                                        .length ==
                                                                    4
                                                                ? Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        '${partnerData[index].dayList[0].dayName} | Time from ${partnerData[index].dayList[0].timeFrom} Time to ${partnerData[index].dayList[0].timeTo}',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontFamily:
                                                                                'Roboto_Condensed',
                                                                            fontSize:
                                                                                14),
                                                                      ),
                                                                      Text(
                                                                        '${partnerData[index].dayList[1].dayName} | Time from ${partnerData[index].dayList[1].timeFrom} Time to ${partnerData[index].dayList[1].timeTo}',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontFamily:
                                                                                'Roboto_Condensed',
                                                                            fontSize:
                                                                                14),
                                                                      ),
                                                                      Text(
                                                                        '${partnerData[index].dayList[2].dayName} | Time from ${partnerData[index].dayList[2].timeFrom} Time to ${partnerData[index].dayList[2].timeTo}',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontFamily:
                                                                                'Roboto_Condensed',
                                                                            fontSize:
                                                                                14),
                                                                      ),
                                                                      Text(
                                                                        '${partnerData[index].dayList[3].dayName} | Time from ${partnerData[index].dayList[3].timeFrom} Time to ${partnerData[index].dayList[3].timeTo}',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontFamily:
                                                                                'Roboto_Condensed',
                                                                            fontSize:
                                                                                14),
                                                                      )
                                                                    ],
                                                                  )
                                                                : partnerData[index]
                                                                            .dayList
                                                                            .length ==
                                                                        5
                                                                    ? Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            '${partnerData[index].dayList[0].dayName} | Time from ${partnerData[index].dayList[0].timeFrom} Time to ${partnerData[index].dayList[0].timeTo}',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontFamily: 'Roboto_Condensed',
                                                                                fontSize: 14),
                                                                          ),
                                                                          Text(
                                                                            '${partnerData[index].dayList[1].dayName} | Time from ${partnerData[index].dayList[1].timeFrom} Time to ${partnerData[index].dayList[1].timeTo}',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontFamily: 'Roboto_Condensed',
                                                                                fontSize: 14),
                                                                          ),
                                                                          Text(
                                                                            '${partnerData[index].dayList[2].dayName} | Time from ${partnerData[index].dayList[2].timeFrom} Time to ${partnerData[index].dayList[2].timeTo}',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontFamily: 'Roboto_Condensed',
                                                                                fontSize: 14),
                                                                          ),
                                                                          Text(
                                                                            '${partnerData[index].dayList[3].dayName} | Time from ${partnerData[index].dayList[3].timeFrom} Time to ${partnerData[index].dayList[3].timeTo}',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontFamily: 'Roboto_Condensed',
                                                                                fontSize: 14),
                                                                          ),
                                                                          Text(
                                                                            '${partnerData[index].dayList[4].dayName} | Time from ${partnerData[index].dayList[4].timeFrom} Time to ${partnerData[index].dayList[4].timeTo}',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontFamily: 'Roboto_Condensed',
                                                                                fontSize: 14),
                                                                          )
                                                                        ],
                                                                      )
                                                                    : partnerData[index].dayList.length ==
                                                                            6
                                                                        ? Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                '${partnerData[index].dayList[0].dayName} | Time from ${partnerData[index].dayList[0].timeFrom} Time to ${partnerData[index].dayList[0].timeTo}',
                                                                                style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontFamily: 'Roboto_Condensed',
                                                                                  fontSize: 14,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                '${partnerData[index].dayList[1].dayName} | Time from ${partnerData[index].dayList[1].timeFrom} Time to ${partnerData[index].dayList[1].timeTo}',
                                                                                style: TextStyle(color: Colors.white, fontFamily: 'Roboto_Condensed', fontSize: 14),
                                                                              ),
                                                                              Text(
                                                                                '${partnerData[index].dayList[2].dayName} | Time from ${partnerData[index].dayList[2].timeFrom} Time to ${partnerData[index].dayList[2].timeTo}',
                                                                                style: TextStyle(color: Colors.white, fontFamily: 'Roboto_Condensed', fontSize: 14),
                                                                              ),
                                                                              Text(
                                                                                '${partnerData[index].dayList[3].dayName} | Time from ${partnerData[index].dayList[3].timeFrom} Time to ${partnerData[index].dayList[3].timeTo}',
                                                                                style: TextStyle(color: Colors.white, fontFamily: 'Roboto_Condensed', fontSize: 14),
                                                                              ),
                                                                              Text(
                                                                                '${partnerData[index].dayList[4].dayName} | Time from ${partnerData[index].dayList[4].timeFrom} Time to ${partnerData[index].dayList[4].timeTo}',
                                                                                style: TextStyle(color: Colors.white, fontFamily: 'Roboto_Condensed', fontSize: 14),
                                                                              ),
                                                                              Text(
                                                                                '${partnerData[index].dayList[5].dayName} | Time from ${partnerData[index].dayList[5].timeFrom} Time to ${partnerData[index].dayList[5].timeTo}',
                                                                                style: TextStyle(color: Colors.white, fontFamily: 'Roboto_Condensed', fontSize: 14),
                                                                              )
                                                                            ],
                                                                          )
                                                                        : Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                '${partnerData[index].dayList[0].dayName} | Time from ${partnerData[index].dayList[0].timeFrom} Time to ${partnerData[index].dayList[0].timeTo}',
                                                                                style: TextStyle(color: Colors.white, fontFamily: 'Roboto_Condensed', fontSize: 14),
                                                                              ),
                                                                              Text(
                                                                                '${partnerData[index].dayList[1].dayName} | Time from ${partnerData[index].dayList[1].timeFrom} Time to ${partnerData[index].dayList[1].timeTo}',
                                                                                style: TextStyle(color: Colors.white, fontFamily: 'Roboto_Condensed', fontSize: 14),
                                                                              ),
                                                                              Text(
                                                                                '${partnerData[index].dayList[2].dayName} | Time from ${partnerData[index].dayList[2].timeFrom} Time to ${partnerData[index].dayList[2].timeTo}',
                                                                                style: TextStyle(color: Colors.white, fontFamily: 'Roboto_Condensed', fontSize: 14),
                                                                              ),
                                                                              Text(
                                                                                '${partnerData[index].dayList[3].dayName} | Time from ${partnerData[index].dayList[3].timeFrom} Time to ${partnerData[index].dayList[3].timeTo}',
                                                                                style: TextStyle(color: Colors.white, fontFamily: 'Roboto_Condensed', fontSize: 14),
                                                                              ),
                                                                              Text(
                                                                                '${partnerData[index].dayList[4].dayName} | Time from ${partnerData[index].dayList[4].timeFrom} Time to ${partnerData[index].dayList[4].timeTo}',
                                                                                style: TextStyle(color: Colors.white, fontFamily: 'Roboto_Condensed', fontSize: 14),
                                                                              ),
                                                                              Text(
                                                                                '${partnerData[index].dayList[5].dayName} | Time from ${partnerData[index].dayList[5].timeFrom} Time to ${partnerData[index].dayList[5].timeTo}',
                                                                                style: TextStyle(color: Colors.white, fontFamily: 'Roboto_Condensed', fontSize: 14),
                                                                              ),
                                                                              Text(
                                                                                '${partnerData[index].dayList[6].dayName} | Time from ${partnerData[index].dayList[6].timeFrom} Time to ${partnerData[index].dayList[6].timeTo}',
                                                                                style: TextStyle(color: Colors.white, fontFamily: 'Roboto_Condensed', fontSize: 14),
                                                                              )
                                                                            ],
                                                                          )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // color: Colors.green,
                                  height: 150,
                                  width: 280,
                                  margin: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
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
                                  child: Stack(
                                      // color: Colors.green,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.only(top: 8),
                                              // height: 40,
                                              // width: 100,
                                              margin: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // color: Colors.grey
                                              ),
                                              child: Text(
                                                'Actual Fee: ${partnerData[index].fee}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontFamily:
                                                      'Roboto_Condensed',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              // height: 40,
                                              // width: 100,
                                              margin: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // color: Colors.grey
                                              ),
                                              child: Text(
                                                'Discount Fee: ${partnerData[index].discountedFee}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontFamily:
                                                      'Roboto_Condensed',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              // height: 40,
                                              // width: 100,
                                              margin: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // color: Colors.grey
                                              ),
                                              child: Text(
                                                'Booking Fee: ${partnerData[index].bookingFee}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontFamily:
                                                      'Roboto_Condensed',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          //===========================================================================on Pressed======================================================
                                          bottom: 5,
                                          left: 0,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DocBooking(   _finalpartnerData[index],  _docData)));
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 40,
                                              width: 270,
                                              margin: EdgeInsets.only(
                                                  left: 5, right: 5),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white),
                                              child: Text(
                                                'BOOK',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                              color: Colors.transparent,
                              // height: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 50,
              width: 300,
              height: 50,
              child: Container(
                height: 50,
                // color: Colors.green,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      // => _makingPhoneCall,

                      // onTap: () => launch(("tel://0505050505")),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: 80,
                        color: Colors.white,
                        child: Icon(
                          Icons.call,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      // =>_text,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: 80,
                        color: Colors.white,
                        child: Icon(
                          Icons.message,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
