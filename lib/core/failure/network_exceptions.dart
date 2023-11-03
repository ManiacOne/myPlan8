// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class NetworkException{
  dioErrorfunc(DioException dioError){
    if(dioError.response?.data["message"] != null || dioError.response?.data["message"] != ""){
      return dioError.response?.data["message"];
    }
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return "Connection Timeout";

      case DioExceptionType.connectionError:
        return "Connection Error";
      
      case DioExceptionType.badResponse:
        return badResponse(dioError.response!.statusCode, dioError.response!.statusMessage); 

      case DioExceptionType.unknown:
        return "Unknow Error, Please Check your internet connection";
        
      default: return "Please Check your internet connection";
    }
  }

  String badResponse(int? statusCode,String? statusMessage){
    switch (statusCode) {
      case 400:return "Error Bad Request";
      case 404:return "Error Not Found";
      case 500:return "Internal Server Error";
      default: return "Unknown Error, Please Check your internet connection";
    }
  }
  
}