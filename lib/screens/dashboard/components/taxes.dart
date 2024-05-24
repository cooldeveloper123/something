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

class TaxesPage extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<TaxesPage> {
  final formKey = GlobalKey<FormState>();
  var is_loading = false;
  List<TextEditingController> controllers = List.generate(
    20,
        (index) => TextEditingController(),
  );

  XFile _imageFile = XFile('');
  final ImagePicker _picker = ImagePicker();
  Uint8List image = Uint8List(0);

  void takePhoto(ImageSource source, StateSetter setState) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );

    pickedFile!.readAsBytes().then((value) {
      setState(() {
        _imageFile = pickedFile;
        image = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUrl();
  }

  void getUrl() async {
    CollectionReference users = FirebaseFirestore.instance.collection('taxes');
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

  Widget bottomSheet(context, setState) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera, setState);
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery, setState);
                  Navigator.pop(context);
                },
              ),
            ],
          )
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
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: SafeArea(
                child: SingleChildScrollView(
                  primary: false,
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      SizedBox(height: defaultPadding),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                Align(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey),
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Mortage Closing'),
                                            content: StatefulBuilder(
                                                builder: (BuildContext context,
                                                    StateSetter setState) {
                                                  return SingleChildScrollView(
                                                    child: Container(
                                                      padding: EdgeInsets.all(40.0),
                                                      child: Form(
                                                        key: formKey,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(height: 45.0),
                                                            Center(
                                                              child: Text(
                                                                  "Please provide below details",
                                                                  style: TextStyle(
                                                                      fontSize: 25,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                            ),
                                                            SizedBox(height: 35.0),
                                                            ...List.generate(
                                                                controllers.length,
                                                                    (index) {
                                                                  return Padding(
                                                                    padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                        30.0),
                                                                    child: Column(
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        Text(
                                                                          fieldNames[
                                                                          index],
                                                                        ),
                                                                        SizedBox(
                                                                            height: 5.0),
                                                                        TextField(
                                                                          controller:
                                                                          controllers[
                                                                          index],
                                                                          decoration:
                                                                          InputDecoration(
                                                                            enabledBorder:
                                                                            UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                  width:
                                                                                  1,
                                                                                  color: Colors
                                                                                      .black),
                                                                            ),
                                                                            focusedBorder:
                                                                            UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                  color: Colors
                                                                                      .black,
                                                                                  width:
                                                                                  3.0),
                                                                            ),
                                                                            suffixIcon: Icon(
                                                                                Icons
                                                                                    .supervised_user_circle,
                                                                                color: Colors
                                                                                    .black),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                }),
                                                            SizedBox(height: 70.0),
                                                            SizedBox(
                                                              width: double.infinity,
                                                              height: 45,
                                                              child: ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      primary:
                                                                      Colors.black,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(
                                                                              10))),
                                                                  onPressed: () async {
                                                                    Map<String, String>
                                                                    data = {};
                                                                    for (int i = 0;
                                                                    i <
                                                                        controllers
                                                                            .length;
                                                                    i++) {
                                                                      data[fieldNames[
                                                                      i]] =
                                                                          controllers[
                                                                          i]
                                                                              .text;
                                                                    }
                                                                    await FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                        'taxes')
                                                                        .add({
                                                                      "created_at":
                                                                      FieldValue
                                                                          .serverTimestamp(),
                                                                      ...data,
                                                                    });
                                                                    html.window
                                                                        .location
                                                                        .reload();
                                                                  },
                                                                  child:
                                                                  Text("Add")),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Close'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      "Add",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  alignment: Alignment.topRight,
                                ),
                                SizedBox(height: 30),
                                is_loading
                                    ? Container(
                                  padding: EdgeInsets.all(defaultPadding),
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Recent Files",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                          child: DataTable(
                                            columnSpacing:
                                            defaultPadding,
                                            columns: fieldNames
                                                .map((name) =>
                                                DataColumn(
                                                    label: Text(name)))
                                                .toList()
                                              ..addAll([
                                                DataColumn(
                                                  label: Text("Edit"),
                                                ),
                                                DataColumn(
                                                  label: Text("Delete"),
                                                ),
                                              ]),
                                            rows: globals.data != null
                                                ? List.generate(
                                              globals.data!.length,
                                                  (index) => DataRow(
                                                cells: fieldNames
                                                    .map((name) =>
                                                    DataCell(Text(
                                                        globals.data![index]
                                                        [name])))
                                                    .toList()
                                                  ..addAll([
                                                    DataCell(
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                              backgroundColor:
                                                              Colors.grey),
                                                          onPressed:
                                                              () async {
                                                            for (int i = 0;
                                                            i <
                                                                controllers.length;
                                                            i++) {
                                                              controllers[i]
                                                                  .text =
                                                              globals.data![index][fieldNames[i]];
                                                            }
                                                            showDialog(
                                                              context:
                                                              context,
                                                              builder:
                                                                  (BuildContext
                                                              context) {
                                                                return AlertDialog(
                                                                  title:
                                                                  Text('Mortage Closing'),
                                                                  content:
                                                                  StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                                                                    return SingleChildScrollView(
                                                                      child: Container(
                                                                        padding: EdgeInsets.all(40.0),
                                                                        child: Form(
                                                                          key: formKey,
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              SizedBox(height: 45.0),
                                                                              Center(child: Text("Please provide below details", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
                                                                              SizedBox(height: 35.0),
                                                                              ...List.generate(controllers.length, (index) {
                                                                                return Padding(
                                                                                  padding: const EdgeInsets.only(bottom: 30.0),
                                                                                  child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(fieldNames[index]),
                                                                                      SizedBox(height: 5.0),
                                                                                      TextField(
                                                                                        controller: controllers[index],
                                                                                        decoration: InputDecoration(
                                                                                          enabledBorder: UnderlineInputBorder(
                                                                                            borderSide: BorderSide(width: 1, color: Colors.black),
                                                                                          ),
                                                                                          focusedBorder: UnderlineInputBorder(
                                                                                            borderSide: BorderSide(color: Colors.black, width: 3.0),
                                                                                          ),
                                                                                          suffixIcon: Icon(Icons.supervised_user_circle, color: Colors.black),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              }),
                                                                              SizedBox(height: 70.0),
                                                                              SizedBox(
                                                                                width: double.infinity,
                                                                                height: 45,
                                                                                child: ElevatedButton(
                                                                                    style: ElevatedButton.styleFrom(primary: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                                                                    onPressed: () async {
                                                                                      Map<String, String> data = {};
                                                                                      for (int i = 0; i < controllers.length; i++) {
                                                                                        data[fieldNames[i]] = controllers[i].text;
                                                                                      }
                                                                                      await FirebaseFirestore.instance.collection('taxes').doc(globals.docs[index]).update(data);
                                                                                      html.window.location.reload();
                                                                                    },
                                                                                    child: Text("Update")),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () {
                                                                        Navigator.of(context).pop();
                                                                      },
                                                                      child: Text('Close'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Text(
                                                            "Edit",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )),
                                                    DataCell(
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                              backgroundColor:
                                                              Colors.grey),
                                                          onPressed:
                                                              () async {
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                "taxes")
                                                                .doc(globals
                                                                .docs![index])
                                                                .delete();
                                                            html.window
                                                                .location
                                                                .reload();
                                                          },
                                                          child: Text(
                                                            "Delete",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )),
                                                  ]),
                                              ),
                                            )
                                                : [],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                                    : Column(children: [
                                  SizedBox(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.5),
                                  Container(
                                      child: CircularProgressIndicator())
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
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

const fieldNames = [
  "Business Information", "Financial Statements", "Receipts and Invoices", "Expense Categories", "Income Sources", "Employee Information", "Tax Deductions and Credits", "Bank and Financial Statements", "Sales Tax Records", "Asset and Property Records", "Inventory Records (if applicable)", "Tax Returns", "Quarterly Estimated Tax Payments", "Tax Correspondence and Notices", "Employee Benefit Records", "Business Expenses Log", "Tax Preparation Records", "Sales and Purchase Records", "Home Office Records (if applicable)", "Vehicle Records (if business vehicles are used)"


];
