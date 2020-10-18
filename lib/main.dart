import 'package:flutter/material.dart';
import 'package:police/controller.dart';

import 'models/Data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController timeController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  void _submitForm(){
    if(_formKey.currentState.validate()){
      Data data = Data(
          timeController.text,
          areaController.text
      );
      FormController formController = FormController(
              (String response) {
            print(response);
            if (response == FormController.STATUS_SUCCESS) {
                _showSnackBar("Inserted Successfully");
            } else {
              _showSnackBar("Error");
            }
          }
      );
      _showSnackBar("Submitting data");
      formController.submitForm(data);
    }

  }

  _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message),);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
     body: Form(
       key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 25),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: timeController,
              validator: (value){
              if(value.isEmpty){
                return "Enter valid value";

              }else{
                return null;
              }
            },
              decoration: InputDecoration(
                hintText: "Time"
              ),
            ),
            TextFormField(
              controller: areaController,
              validator: (value){
                if(value.isEmpty){
                  return "Enter valid value";

                }else{
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: "Area"
              ),
            ),
            RaisedButton(
              onPressed: (){
                _submitForm();
              },
              child: Text("Save"),
            )
          ],
        ),
      ),)

    );

  }
}


