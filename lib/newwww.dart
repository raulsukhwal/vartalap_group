//
//
// import 'dart:convert';
//
// import 'package:chatapp_firebase/modall.dart';
// import 'package:http/http.dart'as http;
//
//
// Future? GetData() async{
//   var url= Uri.parse('https://jsonplaceholder.typicode.com/posts');
//
//   var response= await http.get(url);
//   print(response.body);
//  if(response.statusCode==200){
//    print(response.body);
// List<Data> abc= dataFromJson(response.body);
// return abc;
//  //List<Data> abc= [];
//  // for(int i=0,i=jsonDecode(response.body.length));
// // jsonDecode(response.body).forEach((element){ abc.add(Data.fromJson(element));});
//    //jsonDecode(response.body);
//
//  }
//  else{print("error");}
//
//
// }
//
//
