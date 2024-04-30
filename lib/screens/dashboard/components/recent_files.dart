import 'dart:js_interop';

import 'package:something/models/RecentFile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:something/globals.dart' as globals;
import '../../../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:something/globals.dart' as globals;

import 'dart:html' as html;

class RecentFiles extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<RecentFiles> {
  final formKey = new GlobalKey<FormState>();
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
@override
  void initState() {
    // TODO: implement initState
    super.initState();



  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  label: Text("Property Name"),
                ),
                DataColumn(
                  label: Text("Property Type"),
                ),
                DataColumn(
                  label: Text("Address"),
                ),
                DataColumn(
                  label: Text("Property Description"),
                ),
                DataColumn(
                  label: Text("Ownership Status"),
                ),
                DataColumn(
                  label: Text("Ownership Percentage"),
                ),
                DataColumn(
                  label: Text("Purchase Date"),
                ),
                DataColumn(
                  label: Text("Purchase Price"),
                ),
                DataColumn(
                  label: Text("Property Size/Area"),
                ),
                DataColumn(
                  label: Text("Number of Units/Bedrooms/Bathrooms"),
                ),
                DataColumn(
                  label: Text("Property Tax ID"),
                ),
                DataColumn(
                  label: Text("Zoning Information"),
                ),
                DataColumn(
                  label: Text("Property Condition"),
                ),
                DataColumn(
                  label: Text("Recent Appraisal Value"),
                ),
                DataColumn(
                  label: Text("Mortgage Information"),
                ),
                DataColumn(
                  label: Text("Insurance Information"),
                ),
                DataColumn(
                  label: Text("Utilities"),
                ),
                DataColumn(
                  label: Text("Property History"),
                ),
                DataColumn(
                  label: Text("Property Documents"),
                ),
                DataColumn(
                  label: Text("Maintenance Records"),
                ),
                DataColumn(
                  label: Text("Current Market Value"),
                ),
                DataColumn(
                  label: Text("Rental Information"),
                ),
                DataColumn(
                  label: Text("Property Expenses"),
                ),
                DataColumn(
                  label: Text("Notes"),
                ),
                DataColumn(
                  label: Text("Location Coordinates"),
                ),
                DataColumn(
                  label: Text("Website"),
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

                    DataCell(Text(globals.data![index]["Property Name"])),
                    DataCell(Text(globals.data![index]["Property Type"])),

                    DataCell(Text(globals.data![index]["Address"])),
                    DataCell(Text(globals.data![index]["Property Description"])),
                    DataCell(Text(globals.data![index]["Ownership Status"])),
                    DataCell(Text(globals.data![index]["Ownership Percentage"])),
                    DataCell(Text(globals.data![index]["Purchase Date"])),
                    DataCell(Text(globals.data![index]["Purchase Price"])),
                    DataCell(Text(globals.data![index]["Property Size"])),
                    DataCell(Text(globals.data![index]["Number of Units"])),
                    DataCell(Text(globals.data![index]["Property Tax ID"])),
                    DataCell(Text(globals.data![index]["Zoning Information"])),
                    DataCell(Text(globals.data![index]["Property Condition"])),
                    DataCell(Text(globals.data![index]["Recent Appraisal Value"])),
                    DataCell(Text(globals.data![index]["Mortgage Information"])),
                    DataCell(Text(globals.data![index]["Insurance Information"])),
                    DataCell(Text(globals.data![index]["Utilities"])),
                    DataCell(Text(globals.data![index]["Property History"])),
                    DataCell(Text(globals.data![index]["Property Documents"])),
                    DataCell(Text(globals.data![index]["Maintenance Records"])),
                    DataCell(Text(globals.data![index]["Current Market Value"])),
                    DataCell(Text(globals.data![index]["Rental Information"])),
                    DataCell(Text(globals.data![index]["Property Expenses"])),
                    DataCell(Text(globals.data![index]["Notes"])),
                    DataCell(Text(globals.data![index]["Location Coordinates"])),
                    DataCell(Text(globals.data![index]["Website"])),

                    DataCell(ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.grey), onPressed: () async{

                      name.text = globals.data![index]["Property Name"];
                      name1.text = globals.data![index]["Property Type"];

                      name2.text = globals.data![index]["Address"];
                      name3.text = globals.data![index]["Property Description"];
                      name4.text = globals.data![index]["Ownership Status"];
                      name5.text = globals.data![index]["Ownership Percentage"];
                      name6.text = globals.data![index]["Purchase Date"];
                      name7.text=globals.data![index]["Purchase Price"];
                      name8.text=globals.data![index]["Property Size"];
                      name9.text=globals.data![index]["Number of Units"];
                      name10.text=globals.data![index]["Property Tax ID"];
                      name11.text=globals.data![index]["Zoning Information"];
                      name12.text=globals.data![index]["Property Condition"];
                      name13.text=globals.data![index]["Recent Appraisal Value"];
                      name14.text=globals.data![index]["Mortgage Information"];
                      name15.text=globals.data![index]["Insurance Information"];
                      name16.text=globals.data![index]["Utilities"];
                      name17.text=globals.data![index]["Property History"];
                      name18.text=globals.data![index]["Property Documents"];
                      name19.text=globals.data![index]["Maintenance Records"];
                      name20.text=globals.data![index]["Current Market Value"];
                      name21.text=globals.data![index]["Rental Information"];
                      name22.text=globals.data![index]["Property Expenses"];
                      name23.text=globals.data![index]["Notes"];
                      name24.text=globals.data![index]["Location Coordinates"];
                      name25.text=globals.data![index]["Website"];
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
                                                  backgroundImage:
                                                  AssetImage("assets/images/logo.png"),
                                                ),
                                                // Positioned(
                                                //   bottom: 20.0,
                                                //   right: 20.0,
                                                //   child: InkWell(
                                                //     onTap: () {
                                                //       showModalBottomSheet(
                                                //         context: context,
                                                //         builder: ((builder) => bottomSheet(context,setState)),
                                                //       );
                                                //
                                                //     },
                                                //     child: Icon(
                                                //       Icons.camera_alt,
                                                //       color: Colors.black,
                                                //       size: 28.0,
                                                //     ),
                                                //   ),
                                                // ),
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


                                                    await FirebaseFirestore.instance.collection('properties').doc(globals.docs![index]).update({

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

                    }, child: Text("Update",style: TextStyle(color: Colors.black),),)),
                    DataCell(ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.grey), onPressed: () async{

await FirebaseFirestore.instance.collection("properties").doc(globals.docs![index]).delete();

html.window.location.reload();

                    }, child: Text("Delete",style: TextStyle(color: Colors.black),),)),

                  ],
                ),
              ):[],
            ),
          ))
        ],
      ),
    );
  }
}
