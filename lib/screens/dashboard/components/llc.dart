import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:something/responsive.dart';
import 'package:something/screens/dashboard/components/my_fields.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:something/globals.dart' as globals;
import 'package:something/screens/dashboard/components/recent_files.dart';
import '../../../constants.dart';

import 'dart:html' as html;

import '../../main/components/side_menu.dart';


class LLCPage extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<LLCPage> {
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

    CollectionReference users = FirebaseFirestore.instance.collection('llc');


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
    return
      Scaffold(
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
                child: SafeArea(
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
                                          title: Text('INFO-LLC'),
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

                                                          SizedBox(height: 35.0),



                                                          Text("LLC Name"),
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

                                                          Text("Form DT"),
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

                                                          Text("State"),
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

                                                          Text("EIN Number"),
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

                                                          Text("Reg Agent"),
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

                                                          Text("Address"),
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

                                                          Text("Registered Agent Address"),
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

                                                          Text("Ownership Structure"),
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

                                                          Text("Members/Manager1"),
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

                                                          Text("Members/Manager2"),
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

                                                          Text("Members/Manager3"),
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

                                                          Text("Operating Agreement"),
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

                                                          Text("Business Purpose"),
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

                                                          Text("Status"),
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

                                                          Text("Tax Status"),
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

                                                          Text("Filing Due Dates"),
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

                                                          Text("Banking Information"),
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

                                                          Text("Financial Information"),
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

                                                          Text("Renew Amount"),
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

                                                          Text("Notes"),
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

                                                          Text("Website"),
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

                                                          Text("Log in information"),
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

                                                          Text("Renewal Date"),
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


                                                                  await FirebaseFirestore.instance.collection('llc').add({

                                                                    "created_at": FieldValue.serverTimestamp(),
                                                                    "LLC Name": name.text,
                                                                    "Form DT": name1.text,
                                                                    "State": name2.text,
                                                                    "EIN Number": name3.text,
                                                                    "Reg Agent": name4.text,
                                                                    "Address": name5.text,
                                                                    "Registered Agent Address": name6.text,
                                                                    "Ownership Structure": name7.text,
                                                                    "Manager1": name8.text,
                                                                    "Manager2": name9.text,
                                                                    "Manager3": name10.text,
                                                                    "Operating Agreement": name11.text,
                                                                    "Business Purpose": name12.text,
                                                                    "Status": name13.text,
                                                                    "Tax Status": name14.text,
                                                                    "Filing Due Dates": name15.text,
                                                                    "Banking Information": name16.text,
                                                                    "Financial Information": name17.text,
                                                                    "Renew Amount": name18.text,
                                                                    "Notes": name19.text,
                                                                    "Website": name20.text,
                                                                    "Log in information": name21.text,
                                                                    "Renewal Date": name22.text,






                                                                  });
                                                                  html.window.location.reload();
                                                                },
                                                                child: Text("Add")),
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
                                  is_loading ?  Container(
                                    padding: EdgeInsets.all(defaultPadding),
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Recent Files",
                                          style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                        SingleChildScrollView(scrollDirection:Axis.horizontal,child:
                                        Container(

                                          child: DataTable(
                                            columnSpacing: defaultPadding,
                                            // minWidth: 600,
                                            columns: [
                                              DataColumn(
                                                label: Text("LLC Name"),
                                              ),
                                              DataColumn(
                                                label: Text("Form DT"),
                                              ),
                                              DataColumn(
                                                label: Text("State"),
                                              ),
                                              DataColumn(
                                                label: Text("EIN Number"),
                                              ),
                                              DataColumn(
                                                label: Text("Reg Agent"),
                                              ),
                                              DataColumn(
                                                label: Text("Address"),
                                              ),
                                              DataColumn(
                                                label: Text("Registered Agent Address"),
                                              ),
                                              DataColumn(
                                                label: Text("Ownership Structure"),
                                              ),
                                              DataColumn(
                                                label: Text("Members/Manager1"),
                                              ),
                                              DataColumn(
                                                label: Text("Members/Manager2"),
                                              ),
                                              DataColumn(
                                                label: Text("Members/Manager3"),
                                              ),
                                              DataColumn(
                                                label: Text("Operating Agreement"),
                                              ),
                                              DataColumn(
                                                label: Text("Business Purpose"),
                                              ),
                                              DataColumn(
                                                label: Text("Status"),
                                              ),
                                              DataColumn(
                                                label: Text("Tax Status"),
                                              ),
                                              DataColumn(
                                                label: Text("Filing Due Dates"),
                                              ),
                                              DataColumn(
                                                label: Text("Banking Information"),
                                              ),
                                              DataColumn(
                                                label: Text("Financial Information"),
                                              ),
                                              DataColumn(
                                                label: Text("Renew Amount"),
                                              ),
                                              DataColumn(
                                                label: Text("Notes"),
                                              ),
                                              DataColumn(
                                                label: Text("Website"),
                                              ),

                                              DataColumn(
                                                label: Text("Log in information"),
                                              ),
                                              DataColumn(
                                                label: Text("Renewal Date"),
                                              ),
                                              DataColumn(
                                                label: Text("Edit"),
                                              ),
                                              DataColumn(
                                                label: Text("Delete"),
                                              ),

                                            ],
                                            rows: globals.data!= null ? List.generate(
                                              globals.data!.length,
                                                  (index) => DataRow(
                                                cells: [

                                                  DataCell(Text(globals.data![index]["LLC Name"])),
                                                  DataCell(Text(globals.data![index]["Form DT"])),

                                                  DataCell(Text(globals.data![index]["State"])),
                                                  DataCell(Text(globals.data![index]["EIN Number"])),
                                                  DataCell(Text(globals.data![index]["Reg Agent"])),
                                                  DataCell(Text(globals.data![index]["Address"])),
                                                  DataCell(Text(globals.data![index]["Registered Agent Address"])),
                                                  DataCell(Text(globals.data![index]["Ownership Structure"])),
                                                  DataCell(Text(globals.data![index]["Manager1"])),
                                                  DataCell(Text(globals.data![index]["Manager2"])),
                                                  DataCell(Text(globals.data![index]["Manager3"])),
                                                  DataCell(Text(globals.data![index]["Operating Agreement"])),
                                                  DataCell(Text(globals.data![index]["Business Purpose"])),
                                                  DataCell(Text(globals.data![index]["Status"])),
                                                  DataCell(Text(globals.data![index]["Tax Status"])),
                                                  DataCell(Text(globals.data![index]["Filing Due Dates"])),
                                                  DataCell(Text(globals.data![index]["Banking Information"])),


                                                  DataCell(Text(globals.data![index]["Financial Information"])),
                                                  DataCell(Text(globals.data![index]["Renew Amount"])),
                                                  DataCell(Text(globals.data![index]["Notes"])),
                                                  DataCell(Text(globals.data![index]["Website"])),
                                                  DataCell(Text(globals.data![index]["Log in information"])),
                                                  DataCell(Text(globals.data![index]["Renewal Date"])),
                                                  DataCell( ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.grey), onPressed: () async{

                                                    name.text = globals.data![index]["LLC Name"];
                                                    name1.text = globals.data![index]["Form DT"];

                                                    name2.text = globals.data![index]["State"];
                                                    name3.text = globals.data![index]["EIN Number"];
                                                    name4.text = globals.data![index]["Reg Agent"];
                                                    name5.text =globals.data![index]["Address"];
                                                    name6.text =globals.data![index]["Registered Agent Address"];



                                                    name7.text=globals.data![index]["Ownership Structure"];
                                                    name8.text=globals.data![index]["Manager1"];
                                                    name9.text=globals.data![index]["Manager2"];
                                                    name10.text=globals.data![index]["Manager3"];
                                                    name11.text=globals.data![index]["Operating Agreement"];
                                                    name12.text=globals.data![index]["Business Purpose"];
                                                    name13.text=globals.data![index]["Status"];
                                                    name14.text=globals.data![index]["Tax Status"];
                                                    name15.text=globals.data![index]["Filing Due Dates"];
                                                    name16.text=globals.data![index]["Banking Information"];

                                                    name17.text=globals.data![index]["Financial Information"];
                                                    name18.text=globals.data![index]["Renew Amount"];
                                                    name19.text=globals.data![index]["Notes"];
                                                    name20.text=globals.data![index]["Website"];
                                                    name21.text=globals.data![index]["Log in information"];
                                                    name22.text=globals.data![index]["Renewal Date"];
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          title: Text('INFO-LLC'),
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

                                                                          SizedBox(height: 35.0),



                                                                          Text("LLC Name"),
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

                                                                          Text("Form DT"),
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

                                                                          Text("State"),
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

                                                                          Text("EIN Number"),
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

                                                                          Text("Reg Agent"),
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

                                                                          Text("Address"),
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

                                                                          Text("Registered Agent Address"),
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

                                                                          Text("Ownership Structure"),
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

                                                                          Text("Members/Manager1"),
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

                                                                          Text("Members/Manager2"),
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

                                                                          Text("Members/Manager3"),
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

                                                                          Text("Operating Agreement"),
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

                                                                          Text("Business Purpose"),
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

                                                                          Text("Status"),
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

                                                                          Text("Tax Status"),
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

                                                                          Text("Filing Due Dates"),
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

                                                                          Text("Banking Information"),
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

                                                                          Text("Financial Information"),
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

                                                                          Text("Renew Amount"),
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

                                                                          Text("Notes"),
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

                                                                          Text("Website"),
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

                                                                          Text("Log in information"),
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

                                                                          Text("Renewal Date"),
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


                                                                                  await FirebaseFirestore.instance.collection('llc').doc(globals.docs[index]).update({

                                                                                    "LLC Name": name.text,
                                                                                    "Form DT": name1.text,
                                                                                    "State": name2.text,
                                                                                    "EIN Number": name3.text,
                                                                                    "Reg Agent": name4.text,
                                                                                    "Address": name5.text,
                                                                                    "Registered Agent Address": name6.text,
                                                                                    "Ownership Structure": name7.text,
                                                                                    "Manager1": name8.text,
                                                                                    "Manager2": name9.text,
                                                                                    "Manager3": name10.text,
                                                                                    "Operating Agreement": name11.text,
                                                                                    "Business Purpose": name12.text,
                                                                                    "Status": name13.text,
                                                                                    "Tax Status": name14.text,
                                                                                    "Filing Due Dates": name15.text,
                                                                                    "Banking Information": name16.text,
                                                                                    "Financial Information": name17.text,
                                                                                    "Renew Amount": name18.text,
                                                                                    "Notes": name19.text,
                                                                                    "Website": name20.text,
                                                                                    "Log in information": name21.text,
                                                                                    "Renewal Date": name22.text,






                                                                                  });
                                                                                  html.window.location.reload();
                                                                                },
                                                                                child: Text("Update")),
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

                                                  }, child: Text("Edit",style: TextStyle(color: Colors.black),),)),
                                                  DataCell( ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.grey), onPressed: () async{


                                                    await FirebaseFirestore.instance.collection("llc").doc(globals.docs![index]).delete();

                                                    html.window.location.reload();


                                                  }, child: Text("Delete",style: TextStyle(color: Colors.black),),)),



                                                ],
                                              ),
                                            ):[],
                                          ),
                                        ))
                                      ],
                                    ),
                                  ) : Column(children:[
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
