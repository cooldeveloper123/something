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


class UtilityPage extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<UtilityPage> {
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

    CollectionReference users = FirebaseFirestore.instance.collection('utilities');


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
                                          title: Text('Utilities'),
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



                                                          Text("Utility Name"),
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

                                                          Text("Utility Type"),
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

                                                          Text("Account Holder"),
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

                                                          Text("Account Number"),
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

                                                          Text("Service Provider"),
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

                                                          Text("Contact Information"),
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

                                                          Text("Billing Address"),
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

                                                          Text("Billing Frequency"),
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

                                                          Text("Due Dates"),
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

                                                          Text("Payment Method"),
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

                                                          Text("Meter Reading"),
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

                                                          Text("Usage History"),
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

                                                          Text("Account Status"),
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

                                                          Text("Notes"),
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

                                                          Text("Website"),
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

                                                          Text("Log in information"),
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

                                                          Text("Location"),
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


                                                                  await FirebaseFirestore.instance.collection('utilities').add({

                                                                    "created_at": FieldValue.serverTimestamp(),
                                                                    "Utility Name": name.text,
                                                                    "Utility Type": name1.text,
                                                                    "Account Holder": name2.text,
                                                                    "Account Number": name3.text,
                                                                    "Service Provider": name4.text,
                                                                    "Contact Information": name5.text,
                                                                    "Billing Address": name6.text,
                                                                    "Billing Frequency": name7.text,
                                                                    "Due Dates": name8.text,
                                                                    "Payment Method": name9.text,
                                                                    "Meter Reading": name10.text,
                                                                    "Usage History": name11.text,
                                                                    "Account Status": name12.text,
                                                                    "Notes": name13.text,
                                                                    "Website": name14.text,
                                                                    "Log in information": name15.text,
                                                                    "Location": name16.text,





                                                                  });
                                                                  html.window.location.reload();
                                                                },
                                                                child: Text("Verify Now")),
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
                                                label: Text("Utility Name"),
                                              ),
                                              DataColumn(
                                                label: Text("Utility Type"),
                                              ),
                                              DataColumn(
                                                label: Text("Account Holder"),
                                              ),
                                              DataColumn(
                                                label: Text("Account Number"),
                                              ),
                                              DataColumn(
                                                label: Text("Service Provider"),
                                              ),
                                              DataColumn(
                                                label: Text("Contact Information"),
                                              ),
                                              DataColumn(
                                                label: Text("Billing Address"),
                                              ),
                                              DataColumn(
                                                label: Text("Billing Frequency"),
                                              ),
                                              DataColumn(
                                                label: Text("Due Dates"),
                                              ),
                                              DataColumn(
                                                label: Text("Payment Method"),
                                              ),
                                              DataColumn(
                                                label: Text("Meter Reading"),
                                              ),
                                              DataColumn(
                                                label: Text("Usage History"),
                                              ),
                                              DataColumn(
                                                label: Text("Account Status"),
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
                                                label: Text("Location"),
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

                                                      DataCell(Text(globals.data![index]["Utility Name"])),
                                                      DataCell(Text(globals.data![index]["Utility Type"])),

                                                      DataCell(Text(globals.data![index]["Account Holder"])),
                                                      DataCell(Text(globals.data![index]["Account Number"])),
                                                      DataCell(Text(globals.data![index]["Service Provider"])),
                                                      DataCell(Text(globals.data![index]["Contact Information"])),
                                                      DataCell(Text(globals.data![index]["Billing Address"])),
                                                      DataCell(Text(globals.data![index]["Billing Frequency"])),
                                                      DataCell(Text(globals.data![index]["Due Dates"])),
                                                      DataCell(Text(globals.data![index]["Payment Method"])),
                                                      DataCell(Text(globals.data![index]["Meter Reading"])),
                                                      DataCell(Text(globals.data![index]["Usage History"])),
                                                      DataCell(Text(globals.data![index]["Account Status"])),
                                                      DataCell(Text(globals.data![index]["Notes"])),
                                                      DataCell(Text(globals.data![index]["Website"])),
                                                      DataCell(Text(globals.data![index]["Log in information"])),
                                                      DataCell(Text(globals.data![index]["Location"])),
                                                      DataCell( ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.grey), onPressed: () async{

                                                        name.text = globals.data![index]["Utility Name"];
                                                        name1.text = globals.data![index]["Utility Type"];

                                                        name2.text = globals.data![index]["Account Holder"];
                                                        name3.text = globals.data![index]["Account Number"];
                                                        name4.text = globals.data![index]["Service Provider"];
                                                        name5.text =globals.data![index]["Contact Information"];
                                                        name6.text =globals.data![index]["Billing Address"];



                                                        name7.text=globals.data![index]["Billing Frequency"];
                                                        name8.text=globals.data![index]["Due Dates"];
                                                        name9.text=globals.data![index]["Payment Method"];
                                                        name10.text=globals.data![index]["Meter Reading"];
                                                        name11.text=globals.data![index]["Usage History"];
                                                        name12.text=globals.data![index]["Account Status"];
                                                        name13.text=globals.data![index]["Notes"];
                                                        name14.text=globals.data![index]["Website"];
                                                        name15.text=globals.data![index]["Log in information"];
                                                        name16.text=globals.data![index]["Location"];


                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            return AlertDialog(
                                                              title: Text('Utilities'),
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



                                                                              Text("Utility Name"),
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

                                                                              Text("Utility Type"),
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

                                                                              Text("Account Holder"),
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

                                                                              Text("Account Number"),
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

                                                                              Text("Service Provider"),
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

                                                                              Text("Contact Information"),
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

                                                                              Text("Billing Address"),
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

                                                                              Text("Billing Frequency"),
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

                                                                              Text("Due Dates"),
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

                                                                              Text("Payment Method"),
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

                                                                              Text("Meter Reading"),
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

                                                                              Text("Usage History"),
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

                                                                              Text("Account Status"),
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

                                                                              Text("Notes"),
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

                                                                              Text("Website"),
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

                                                                              Text("Log in information"),
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

                                                                              Text("Location"),
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


                                                                                      await FirebaseFirestore.instance.collection('utilities').doc(globals.docs[index]).update({


                                                                                        "Utility Name": name.text,
                                                                                        "Utility Type": name1.text,
                                                                                        "Account Holder": name2.text,
                                                                                        "Account Number": name3.text,
                                                                                        "Service Provider": name4.text,
                                                                                        "Contact Information": name5.text,
                                                                                        "Billing Address": name6.text,
                                                                                        "Billing Frequency": name7.text,
                                                                                        "Due Dates": name8.text,
                                                                                        "Payment Method": name9.text,
                                                                                        "Meter Reading": name10.text,
                                                                                        "Usage History": name11.text,
                                                                                        "Account Status": name12.text,
                                                                                        "Notes": name13.text,
                                                                                        "Website": name14.text,
                                                                                        "Log in information": name15.text,
                                                                                        "Location": name16.text,





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

                                                      }, child: Text("Edit",style: TextStyle(color: Colors.black),),)),
                                                      DataCell( ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.grey), onPressed: () async{


                                                        await FirebaseFirestore.instance.collection("utilities").doc(globals.docs![index]).delete();

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
