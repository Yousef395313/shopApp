

import 'package:dio/dio.dart';

import '../end_points.dart';

class dioHelper{
  static  late Dio dio ;
  static init(){
     dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        headers: {
          'Content-Type': 'application/json',
        },
        receiveDataWhenStatusError: true,
      )
    );
  }
  static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
  })async
  {
    return dio.get(
      url,
      queryParameters: query,
    );
  }
  static Future<Response> postData({
    required String url,
    Map<String , dynamic>? query,
    required Map<String ,dynamic> data,
  })async
  {
    return dio.post(
        url,
        data:data,
        queryParameters: query,
    );
  }
}
// class dioHelper{
//     late Dio dio ;
//     dioHelper(){
//       BaseOptions options =BaseOptions(
//         baseUrl:'https://student.valuxapps.com/api/',
//         headers: {
//           'Content-Type': 'application/json'
//         },
//         receiveDataWhenStatusError: true,
//       );
//       dio =Dio(options);
//   }
//    Future<dynamic>getData({
//     required String url,
//     required Map<String,dynamic> query,
// })
// async
//   {
//     try
//     {
//       Response response = await dio.get(url,queryParameters: query);
//       print(response.data.toString());
//       return response.data;
//     }
//     catch(e){
//       print(e.toString());
//     }
//
//   }
//
//       Future<Response?>postData({
//       required String url,
//       Map<String,dynamic>? query,
//       required Map<String,dynamic> data,
//
//     })
//     async
//     {
//       try
//       {
//         Response response = await dio.post(url,queryParameters: query,data: data);
//         print(response.data.toString());
//         return response.data;
//       }
//       catch(e){
//         print(e.toString());
//       }
//       return null;
//     }
  // static Future<Response> getData({
  //   required String url,
  //   required Map<String,dynamic> query,
  // })async
  // {
  //   return dio.get(
  //     url,
  //     queryParameters: query,
  //   );
  // }
  // static Future<Response> postData({
  //   required String url,
  //   Map<String , dynamic>? query,
  //   required Map<String ,dynamic> data,
  // })async
  // {
  //   return dio.post(
  //     url,
  //     data:data,
  //     queryParameters: query,
  //   );
  // }
