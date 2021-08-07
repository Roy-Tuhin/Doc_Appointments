import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medbo/screens/home.dart';
class LastVisit extends StatelessWidget {

  // final List<String> appointmentPlace=<String>['Kolkata'];
  final details= 'Morbi a metus. Phasellus enim erat, vestibulum vel, aliquam a, posuere eu, velit. Nullam sapien sem, ornare ac, nonummy non, lobortis a, enim. Nunc tincidunt ante vitae massa. Duis ante orci, molestie vitae, vehicula venenatis, tincidunt ac, pede. Nulla accumsan, elit sit amet varius semper, nulla mauris mollis quam, tempor suscipit diam nulla vel leo. Etiam commodo dui eget wisi. Donec iaculis gravida nulla. Donec quis nibh at felis congue commodo. Etiam bibendum elit eget erat. Aenean placerat. In vulputate urna eu arcu. Aliquam erat volutpat. Suspendisse potenti. Morbi mattis felis at nunc. Duis viverra diam non justo. In nisl.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Last Visited', style: TextStyle(fontFamily: 'Roboto_Condensed'),),
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
          // Navigator.of(context).pushNamed('/home');
          },),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.lightBlue[50],
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 450,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.center,
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor,
                      ],
                    ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            child: Text('Appointment Place',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold,fontFamily: 'Roboto_Condensed',),),
                          ),

                          Container(
                            // margin: EdgeInsets.all(10),
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.only(left:10.0,top: 0.0,right: 10.0,bottom: 0.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage("assets/images/medbo-doctors.png"),
                                  fit: BoxFit.cover),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            child: Text('Hospital Name',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold,fontFamily: 'Roboto_Condensed',),),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 50,),

                    Container(
                      // color: Colors.grey,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // color: Colors.green,
                            height: 80,width: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Text('1',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto_Condensed',),),
                                Text('Events',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto_Condensed',),),],),
                          ),
                          Container(
                            // color: Colors.green,
                            height: 80,width: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Text('1',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto_Condensed',),),
                                Text('Patient',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto_Condensed',),),],),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),

              InkWell(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 15,horizontal: 30 ),
                  // padding: EdgeInsets.only(left: 15.0,right: 15.0),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  // color: Colors.green,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.center,
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor
                      ] ,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(width: 50,child: Icon(Icons.call,color: Colors.white,),),
                      Container(width: 300,alignment: Alignment.center,
                          child: Text('Call to Book Again',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto_Condensed',),)),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Container(
                // color: Colors.green,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      // color: Colors.green,
                      // height: 100,
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Text('Details: ',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto_Condensed',),)
                    ),
                    Container(
                      // color: Colors.grey,
                      // height: 100,
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Text('${details}',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 15,fontFamily: 'Roboto_Condensed',),)
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.green,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      // color: Colors.green,
                      // height: 100,
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Text('Date and Time: ',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Roboto_Condensed',),)
                    ),
                    Container(
                      // color: Colors.grey,
                      // height: 100,
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Text('${details}',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 15,fontFamily: 'Roboto_Condensed',),)
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


