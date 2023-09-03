import 'package:dio/dio.dart';

class DioHelper{
  static Dio? dio;
  static String token="";
  static Map<String,dynamic> headers={
    "Accept":"application/json",
    "Content-type":"application/json",
    if(token.isNotEmpty)"Authorization":token
  };
  static init(){
    dio=Dio(
      BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
        receiveDataWhenStatusError: true,
        responseType: ResponseType.json,
        headers: headers
      )
    );
  }
  static Future<Response> getdata({
    required String path,
    Map<String,dynamic>? body
  }) async{

    final response=await dio!.get(path,data: body);
    return response;
  }
  static Future<Response> postdata({
    required String path,
    Map<String,dynamic>? body,
    Map<String,dynamic>? queryparams
  }) async{
    final response=await dio!.post(path,data: body,queryParameters: queryparams);
    return response;
  }


}