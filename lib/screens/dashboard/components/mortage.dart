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


class MortagePage extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<MortagePage> {
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

    CollectionReference users = FirebaseFirestore.instance.collection('mortage');


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



                                                          Text("MFID"),
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

                                                          Text("Company Name"),
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

                                                          Text("Account Number"),
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

                                                          Text("Date of Purchase"),
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

                                                          Text("Downpayment"),
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

                                                          Text("Balance"),
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

                                                          Text("Balance Date"),
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

                                                          Text("Contact Number"),
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

                                                          Text("Title Company"),
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

                                                          Text("Title Co Contact"),
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


                                                                  await FirebaseFirestore.instance.collection('mortage').add({

                                                                    "created_at": FieldValue.serverTimestamp(),
                                                                    "MFID": name.text,
                                                                    "Company Name": name1.text,
                                                                    "Account Number": name2.text,
                                                                    "Date of Purchase": name3.text,
                                                                    "Downpayment": name4.text,
                                                                    "Balance": name5.text,
                                                                    "Balance Date": name6.text,
                                                                    "Contact Number": name7.text,
                                                                    "Title Company": name8.text,
                                                                    "Title Co Contact": name9.text,







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
                                                label: Text("MFID"),
                                              ),
                                              DataColumn(
                                                label: Text("Company Name"),
                                              ),
                                              DataColumn(
                                                label: Text("Account Number"),
                                              ),
                                              DataColumn(
                                                label: Text("Date of Purchase"),
                                              ),
                                              DataColumn(
                                                label: Text("Downpayment"),
                                              ),
                                              DataColumn(
                                                label: Text("Balance"),
                                              ),
                                              DataColumn(
                                                label: Text("Balance Date"),
                                              ),
                                              DataColumn(
                                                label: Text("Contact Number"),
                                              ),
                                              DataColumn(
                                                label: Text("Title Company"),
                                              ),
                                              DataColumn(
                                                label: Text("Title Co Contact"),
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

                                                  DataCell(Text(globals.data![index]["MFID"])),
                                                  DataCell(Text(globals.data![index]["Company Name"])),

                                                  DataCell(Text(globals.data![index]["Account Number"])),
                                                  DataCell(Text(globals.data![index]["Date of Purchase"])),
                                                  DataCell(Text(globals.data![index]["Downpayment"])),
                                                  DataCell(Text(globals.data![index]["Balance"])),
                                                  DataCell(Text(globals.data![index]["Balance Date"])),
                                                  DataCell(Text(globals.data![index]["Contact Number"])),
                                                  DataCell(Text(globals.data![index]["Title Company"])),
                                                  DataCell(Text(globals.data![index]["Title Co Contact"])),

                                                  DataCell( ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.grey), onPressed: () async{

                                                    name.text = globals.data![index]["MFID"];
                                                    name1.text = globals.data![index]["Company Name"];

                                                    name2.text = globals.data![index]["Account Number"];
                                                    name3.text = globals.data![index]["Date of Purchase"];
                                                    name4.text = globals.data![index]["Downpayment"];
                                                    name5.text =globals.data![index]["Balance"];
                                                    name6.text =globals.data![index]["Balance Date"];



                                                    name7.text=globals.data![index]["Contact Number"];
                                                    name8.text=globals.data![index]["Title Company"];
                                                    name9.text=globals.data![index]["Title Co Contact"];

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



                                                                          Text("MFID"),
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

                                                                          Text("Company Name"),
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

                                                                          Text("Account Number"),
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

                                                                          Text("Date of Purchase"),
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

                                                                          Text("Downpayment"),
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

                                                                          Text("Balance"),
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

                                                                          Text("Balance Date"),
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

                                                                          Text("Contact Number"),
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

                                                                          Text("Title Company"),
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

                                                                          Text("Title Co Contact"),
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


                                                                                  await FirebaseFirestore.instance.collection('mortage')..doc(globals.docs[index]).update({


                                                                                    "MFID": name.text,
                                                                                    "Company Name": name1.text,
                                                                                    "Account Number": name2.text,
                                                                                    "Date of Purchase": name3.text,
                                                                                    "Downpayment": name4.text,
                                                                                    "Balance": name5.text,
                                                                                    "Balance Date": name6.text,
                                                                                    "Contact Number": name7.text,
                                                                                    "Title Company": name8.text,
                                                                                    "Title Co Contact": name9.text,







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


                                                    await FirebaseFirestore.instance.collection("mortage").doc(globals.docs![index]).delete();

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
