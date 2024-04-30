import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:something/responsive.dart';
import 'package:something/screens/dashboard/components/my_fields.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:something/globals.dart' as globals;
import '../../constants.dart';
import '../main/components/side_menu.dart';
import 'components/header.dart';
import 'dart:html' as html;
import 'components/recent_files.dart';
import 'components/storage_details.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashBoardPage> {
  final formKey = new GlobalKey<FormState>();
var is_loading= false;
  TextEditingController name = TextEditingController();
  TextEditingController name1 = TextEditingController();
  TextEditingController name2 = TextEditingController();
  TextEditingController name3 = TextEditingController();
  TextEditingController name4 = TextEditingController();
  TextEditingController name5 = TextEditingController();
  TextEditingController name6 = TextEditingController();
  TextEditingController name7 = TextEditingController();
  TextEditingController name8 = TextEditingController();
  TextEditingController name9 = TextEditingController();
  TextEditingController name10 = TextEditingController();
  TextEditingController name11 = TextEditingController();
  TextEditingController name12 = TextEditingController();
  TextEditingController name13 = TextEditingController();
  TextEditingController name14 = TextEditingController();
  TextEditingController name15 = TextEditingController();
  TextEditingController name16 = TextEditingController();
  TextEditingController name17 = TextEditingController();
  TextEditingController name18 = TextEditingController();
  TextEditingController name19 = TextEditingController();
  TextEditingController name20 = TextEditingController();
  TextEditingController name21 = TextEditingController();
  TextEditingController name22 = TextEditingController();
  TextEditingController name23 = TextEditingController();
  TextEditingController name24 = TextEditingController();
  TextEditingController name25 = TextEditingController();




  XFile _imageFile = XFile('');
  final ImagePicker _picker = ImagePicker();
  Uint8List image = Uint8List(0);

  TextEditingController pan = TextEditingController();
  void takePhoto(ImageSource source,setState) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );


    pickedFile!.readAsBytes().then((value) {

      setState(() {
        _imageFile = pickedFile!;

        image = value;
      });


    });
  }
  @override
  void initState() {
    super.initState();
    getUrl();

  }
  void getUrl()async{

    CollectionReference users = FirebaseFirestore.instance.collection('properties');


    globals.data = [];
    globals.docs = [];

    users.get().then((QuerySnapshot querySnapshot) {

      querySnapshot.docs.forEach((element) {


        globals.data.add(element.data());
globals.docs.add(element.id);



      });
     setState(() {
       is_loading = true;
     });
    }).catchError((error) {
      print('Failed to read data: $error');
    });



  }
  Widget bottomSheet(context,setState) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera,setState);
                Navigator.pop(context);
              },

            ),
            IconButton(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery,setState);
                Navigator.pop(context);

              },

            ),
          ])
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child:  SafeArea(
                child: SingleChildScrollView(
                  primary: false,
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      // Header(),
                      SizedBox(height: defaultPadding),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                // MyFiles(),
                                // SizedBox(height: defaultPadding),
                                Align(child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.grey), onPressed: () async{



                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('User'),
                                        content: StatefulBuilder(  // You need this, notice the parameters below:
                                            builder: (BuildContext context, StateSetter setState) {
                                              return SingleChildScrollView(
                                                child: Container(
                                                  padding: EdgeInsets.all(40.0),
                                                  child: Form(
                                                    key: formKey,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [

                                                        SizedBox(height: 45.0),
                                                        Center(child: Text("Please provide below details",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
                                                        SizedBox(height: 45.0),
                                                        Center(
                                                          child: Stack(children: <Widget>[
                                                            CircleAvatar(
                                                              radius: 80.0,
                                                              backgroundImage: _imageFile.path != '' ?
                                                              Image.memory(image).image: AssetImage("assets/images/logo.png"),
                                                            ),
                                                            Positioned(
                                                              bottom: 20.0,
                                                              right: 20.0,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  showModalBottomSheet(
                                                                    context: context,
                                                                    builder: ((builder) => bottomSheet(context,setState)),
                                                                  );

                                                                },
                                                                child: Icon(
                                                                  Icons.camera_alt,
                                                                  color: Colors.black,
                                                                  size: 28.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ]),
                                                        ),
                                                        SizedBox(height: 35.0),



                                                        Text("Property Name"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),

                                                        SizedBox(height: 30.0),

                                                        Text("Property Type"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name1,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Address"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name2,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Property Description"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name3,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Ownership Status"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name4,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Ownership Percentage"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name5,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Purchase Date"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name6,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Purchase Price"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name7,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Property Size/Area"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name8,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Number of Units/Bedrooms/Bathrooms"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name9,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Property Tax ID"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name10,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Zoning Information"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name11,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Property Condition"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name12,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Recent Appraisal Value"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name13,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Mortgage Information"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name14,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Insurance Information"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name15,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Utilities"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name16,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Property History"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name17,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Property Documents"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name18,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Maintenance Records"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name19,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Current Market Value"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name20,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Rental Information"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name21,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Property Expenses"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name22,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Notes"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name23,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Location Coordinates"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name24,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),


                                                        ),
                                                        SizedBox(height: 30.0),

                                                        Text("Website"),
                                                        SizedBox(height: 5.0),
                                                        TextField(
                                                          controller: name25,
                                                          decoration: InputDecoration(
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(width: 1, color: Colors.black), //<-- SEE HERE

                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black,width: 3.0),
                                                            ),
                                                            suffixIcon: Icon(Icons.supervised_user_circle,color: Colors.black,),


                                                          ),

                                                        ),
                                                        SizedBox(height: 30.0),

                                                        SizedBox(height: 70.0),
                                                        SizedBox(
                                                          width: double.infinity,
                                                          height: 45,
                                                          child:  ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  primary: Colors.black,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(10))),
                                                              onPressed: () async {


                                                                await FirebaseFirestore.instance.collection('properties').add({

                                                                  "created_at": FieldValue.serverTimestamp(),
                                                                  "Property Name": name.text,
                                                                  "Property Type": name1.text,
                                                                  "Address": name2.text,
                                                                  "Property Description": name3.text,
                                                                  "Ownership Status": name4.text,
                                                                  "Ownership Percentage": name5.text,
                                                                  "Purchase Date": name6.text,
                                                                  "Purchase Price": name7.text,
                                                                  "Property Size": name8.text,
                                                                  "Number of Units": name9.text,
                                                                  "Property Tax ID": name10.text,
                                                                  "Zoning Information": name11.text,
                                                                  "Property Condition": name12.text,
                                                                  "Recent Appraisal Value": name13.text,
                                                                  "Mortgage Information": name14.text,
                                                                  "Insurance Information": name15.text,
                                                                  "Utilities": name16.text,
                                                                  "Property History": name17.text,
                                                                  "Property Documents": name18.text,
                                                                  "Maintenance Records": name19.text,
                                                                  "Current Market Value": name20.text,
                                                                  "Rental Information": name21.text,
                                                                  "Property Expenses": name22.text,
                                                                  "Notes": name23.text,
                                                                  "Location Coordinates": name24.text,
                                                                  "Website": name25.text,







                                                                });
                                                                html.window.location.reload();
                                                              },
                                                              child: Text("Submit")),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );}),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              // Close the dialog
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Close'),
                                          ),
                                        ],
                                      ); // Replace with your dialog widget
                                    },
                                  );

                                }, child: Text("Add",style: TextStyle(color: Colors.black),),),
                                  alignment: Alignment.topRight,),
                                SizedBox(height:30),
                                is_loading ?  RecentFiles() : Column(children:[
                                  SizedBox(height: MediaQuery.of(context).size.height*0.5),
                                  Container(child: CircularProgressIndicator())
                                ]),
                              ],
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );



  }
}
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}