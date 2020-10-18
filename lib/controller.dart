import 'models/Data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class  FormController{

  final void Function(String) callback;

   static const String URL = "https://script.google.com/macros/s/AKfycbwbVkJ0QPmQvCwviush1N5dgzKrGirwaL62kXGcM3sundUhhHg/exec";

   static const STATUS_SUCCESS = "SUCCESS";

   FormController(this.callback);

   void submitForm(Data data) async{

     try{
       await http.get(
         URL+data.toParams()   
       ).then((response){
         callback(convert.jsonDecode(response.body)['status']);
       });

     }catch(e){
       print(e);
     }

   }
}