// // To parse this JSON data, do
// //
// //     final data = dataFromJson(jsonString);
//
// import 'dart:convert';
//
// List<Data> dataFromJson(String str) => List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));
//
// String dataToJson(List<Data> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Data {
//   int? userId;
//   int ?id;
//   String? title;
//   String ?body;
//
//   Data({
//      this.userId,
//      this.id,
//      this.title,
//      this.body,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     userId: json["userId"],
//     id: json["id"],
//     title: json["title"],
//     body: json["body"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "userId": userId,
//     "id": id,
//     "title": title,
//     "body": body,
//   };
// }
