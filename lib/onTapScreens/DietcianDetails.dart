import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medbo/Booking/DieticianBooking.dart';
import 'package:medbo/models/DietDetailsModel.dart';

class DietcianDetailsPage extends StatefulWidget {
  //const DietcianDetailsPage({ Key? key, encId }) : super(key: key);
  var encDietcianId;
  var dietName;
  DietcianDetailsPage(this.encDietcianId, this.dietName);

  @override
  _DietcianDetailsPageState createState() => _DietcianDetailsPageState(this.encDietcianId, this.dietName);
}

class _DietcianDetailsPageState extends State<DietcianDetailsPage> {
  var encDietcianIdRef;// Need to pass is encId as a parameter in dietcianDetails Api
  var dietNameRef;
  _DietcianDetailsPageState(this.encDietcianIdRef, this.dietNameRef);

  @override
  void initState() {
    dietcianDetailsApi();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
        var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidth/100);
    var blockSizeVertical= (screenHeight/100);
    return Scaffold(
       appBar: AppBar(
        elevation: 0.0,
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
        title: Center(
          child: Image.asset(
      "assets/images/medbo.png",
      fit: BoxFit.contain,
      height: 52,),
        ),
        //toolbarHeight: 88,
    actions: [
      IconButton(onPressed: () => {}, icon: Icon(Icons.more_vert,size: 0.1,),),
    ],
      ),


      body: Center(
        child: Container(
          child: Column(
            children: [
              Text(
                " Dietician Name : ${widget.dietName}",
              //" dataModel.data.",
              style: TextStyle(
                                        fontFamily: 'Poppins',
                                         fontWeight: FontWeight.bold,
                                        fontSize: blockSizeHorizontal*5,
                                        color: Theme.of(context).primaryColor),
                                    textAlign: TextAlign.center,
                                    maxLines: 4,
              
              ),
              //Text(widget.encDietcianId),// dietcian encId


              //========================================================================


               Container(
                        height: blockSizeVertical*70,//38
                       // width: blockSizeHorizontal*20,
                        //color: Colors.blueAccent,
                        child: FutureBuilder(
                          future: dietcianDetailsApi(),

                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            // if (snapshot.connectionState !=ConnectionState.done) {
                            //   return CircularProgressIndicator();
                            // }
                            if (snapshot.hasError) {
                              return Text("Somthing went wrong");
                            }

                            if (snapshot.hasData) {
                              return ListView.builder(
                                  //  scrollDirection: Axis.horizontal,
                                  //   physics: BouncingScrollPhysics(),
                                  // shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, int index) =>
                                    Stack(children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [


                                 Padding(//====================images 
                                padding: const EdgeInsets.all(5.0),
                                // child: ClipRRect(
                                //    borderRadius: BorderRadius.circular(14.0),
                                //   child: 
                                //   Image(
                                //     // image: NetworkImage(
                                //     //   snapshot.data[index].image,
                                //     // ),
                                //     fit: BoxFit.cover,
                                //     height: blockSizeVertical*18,
                                //     width: blockSizeHorizontal*50,
                                //   ),
                                // ),
                              ),


                              SizedBox(height: blockSizeVertical*0.5),


                              //  Text(
                              //    snapshot.data[index].encPartnerId,
                              //  ),




                                Text(
                                  'Partner Name :  ${snapshot.data[index].partnerName}',//\n  EncPatnerId: ${snapshot.data[index].encPartnerId}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: blockSizeHorizontal*3.5,
                                    fontFamily: 'Poppins',
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                 SizedBox(height: blockSizeVertical*0.8),

                                  Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                // color: Colors.green,
                                child: Center(
                                  child: Text(
                                    'Partner Address : ${snapshot.data[index].partnerAddress} \n Fee: ${snapshot.data[index].fee} \n Discounted Fee: ${snapshot.data[index].discountedFee} \n Booking Fee:  ${snapshot.data[index].bookingFee} ',//put email
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        // fontWeight: FontWeight.bold,
                                        fontSize: blockSizeHorizontal*4,
                                        color: Theme.of(context).primaryColor),
                                    textAlign: TextAlign.center,
                                    maxLines: 4,
                                  ),
                                ),
                              ),




                              SizedBox(height: 20,),

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                 //color: Colors.green,
                                child: Center(
                                  child: Text(
                                    'Day : ${snapshot.data[index].dayList[0]?.dayName} \n Time From :  ${snapshot.data[index].dayList[0]?.timeFrom} - ${snapshot.data[index].dayList[index]?.timeTo} ',//put email
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        // fontWeight: FontWeight.bold,
                                        fontSize: blockSizeHorizontal*3.5,
                                        color: Theme.of(context).primaryColor),
                                    textAlign: TextAlign.center,
                                    maxLines: 4,
                                  ),
                                ),
                              ),



                               Padding(
                                  padding: const EdgeInsets.only(left:100.0,right: 100),
                                  child: Divider(
                                     color: Colors.blueGrey,),
                                ),




                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                // color: Colors.green,
                                child: Center(
                                  child: Text(
                                    'Day : ${snapshot.data[index].dayList[1]?.dayName} \n Time From :  ${snapshot.data[index].dayList[1]?.timeFrom} - ${snapshot.data[index].dayList[1]?.timeTo} ',//put email
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        // fontWeight: FontWeight.bold,
                                        fontSize: blockSizeHorizontal*3.5,
                                        color: Theme.of(context).primaryColor),
                                    textAlign: TextAlign.center,
                                    maxLines: 4,
                                  ),
                                ),
                              ),

                                Padding(
                                  padding: const EdgeInsets.only(left:100.0,right: 100),
                                  child: Divider(
                                     color: Colors.blueGrey,),
                                ),

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                // color: Colors.green,
                                child: Center(
                                  child: Text(
                                    'Day : ${snapshot.data[index].dayList[2]?.dayName} \n Time From :  ${snapshot.data[index].dayList[2]?.timeFrom} - ${snapshot.data[index].dayList[2]?.timeTo} ',//put email
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        // fontWeight: FontWeight.bold,
                                        fontSize: blockSizeHorizontal*3.5,
                                        color: Theme.of(context).primaryColor),
                                    textAlign: TextAlign.center,
                                    maxLines: 4,
                                  ),
                                ),
                              ),





                              //  Container(
                              //   padding: EdgeInsets.symmetric(horizontal: 10),
                              //   // color: Colors.green,
                              //   child: Center(
                              //     child: Text(
                              //       Data[encDietId],//put email
                              //       style: TextStyle(
                              //           fontFamily: 'Poppins',
                              //           // fontWeight: FontWeight.bold,
                              //           fontSize: blockSizeHorizontal*2.5,
                              //           color: Theme.of(context).primaryColor),
                              //       textAlign: TextAlign.center,
                              //       maxLines: 4,
                              //     ),
                              //   ),
                              // ),



                              
                              ]
                              
                              ),
                              SizedBox(height: 360,),
                          Positioned(
                            top: 320,
                            right: 80,
                            left: 80,
                            child: Padding(
                             padding: const EdgeInsets.only(left:15.0, bottom: 5),
                              child: InkWell(
                                onTap: () {
                                Navigator.push(context, MaterialPageRoute( builder: (context) => DieticianBookingPage( snapshot.data[index], widget.dietName, widget.encDietcianId))); //or also can pass "dietNameRef" insted of "widget.dietName"
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: blockSizeVertical*5,
                                  width: blockSizeHorizontal*30,
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
                                  child: Text(
                                    'Boook Appointment',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: blockSizeHorizontal*3.5,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      );
                    }
                            return Center(child: CircularProgressIndicator());
                            //Text("Error while calling");
                          },

                          



                        ),
                      ),



                      // ElevatedButton(
                      //   onPressed: (){
                      //     //DieticianBookingPage(encDietcianIdRef, snapshot.data[index].partnerAddress)
                      //      //Navigator.push(context, MaterialPageRoute( builder: (context) => DieticianBookingPage( snapshot.data[index].encPartnerId, encDietcianIdRef))); 
                      //   }, 
                      //   style: ButtonStyle(
                      //       backgroundColor:
                      //           MaterialStateProperty.all(Color(0xFF79a0be)),
                      //            padding: MaterialStateProperty.all(EdgeInsets.only(left:50,right: 50)),
                      //     ),
                      //   child: Text("Book Now"))






            ],
          ),
        ),
      ),
      
    );
  }





  Future<List<PartnerDatum>> dietcianDetailsApi() async {
    var jsonResponse;

      var response = await http.post(
          Uri.parse("http://medbo.digitalicon.in/api/medboapi/DietDetails"),
          body: ({
            'EncId': encDietcianIdRef,
          }));
      if (response.statusCode == 200) {
        print("Correct");
        print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
         //Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterSearchPage(rresponse: SearchApiResponse.fromJson(jsonResponse))));
          DietDetailsModel dataModel = dietDetailsModelFromJson(response.body);
        print(dataModel.partnerData.length);
        for (final item in dataModel.partnerData) 
        print(item.partnerName);

        List<PartnerDatum> arrData =dataModel.partnerData;
       // print(arrData[1].partnerName);
        return arrData;

      } else {
        print("Wrong Url");
        print(response.body);
        throw Exception("Faild to fetch");
      }
      //return AllDietician();
   
  }







}