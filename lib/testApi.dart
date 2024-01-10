// import 'package:flutter/material.dart';
//
// import 'modall.dart';
// import 'newwww.dart';
//
// class AppTest extends StatefulWidget {
//   const AppTest({super.key});
//
//   @override
//   State<AppTest> createState() => _AppTestState();
// }
//
// class _AppTestState extends State<AppTest> {
//   List<Data> naam = [];
//   @override
//   void initState() {PostData();
//     // TODO: implement initState
//     super.initState();
//
//   }
//   PostData ()async{
//     var data = await  GetData();
//     setState(() {
//       naam=data;
//
//     });
//     print(naam);
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//      body: ListView.builder( itemCount: naam.length,itemBuilder: (context , index){return Card(child: ListTile(
//        leading: Text(naam[index].id.toString(),style: TextStyle(fontSize: 55),),
//      title: Text(naam[index].title.toString()),
//        subtitle: Text(naam[index].body.toString()),
//      ),);}),
//     );
//   }
// }
