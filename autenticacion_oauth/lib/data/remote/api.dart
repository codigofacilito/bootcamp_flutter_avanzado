import 'dart:io';

import 'package:dio/dio.dart';

import '../../utils/constants.dart';

class Api{
  late Dio dio;
  Api(){
    dio = Dio(
    BaseOptions(
      baseUrl:url,
      connectTimeout: const Duration(seconds: 30000),
      receiveTimeout: const Duration(seconds: 30000),
      headers: {
        HttpHeaders.authorizationHeader:"",
        HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"
      }
    )
    );
  }

  Future get(String endpoint,{String accessToken=""})async{
    try{
      addToken(accessToken);
      final Response response = await dio.get(endpoint);
      return validateResponse(response);
    }on DioException catch(error){
      throw Exception("Error interno $error");
    }
  }

  Future post(String endpoint,Map body,{String accessToken=""})async{
    try{
      addToken(accessToken);
      final Response response = await dio.post(endpoint,data: body);
      return validateResponse(response);
    }on DioException catch(error){
      throw Exception("Error interno $error");
    }
  }

  Future put(String endpoint,Map body,{String accessToken=""})async{
    try{
      addToken(accessToken);
      final Response response = await dio.put(endpoint,data: body);
      return validateResponse(response);
    }on DioException catch(error){
      throw Exception("Error interno $error");
    }
  }

  Future delete(String endpoint,{String accessToken=""})async{
    try{
      addToken(accessToken);
      final Response response = await dio.delete(endpoint);
      return validateResponse(response);
    }on DioException catch(error){
      throw Exception("Error interno $error");
    }
  }

  addToken(String accessToken){
    dio.options.headers[HttpHeaders.contentTypeHeader] = (accessToken.isNotEmpty)? "application/x-www-form-urlencoded":"application/json; charset=utf-8";
    dio.options.headers[HttpHeaders.authorizationHeader]= (accessToken.isNotEmpty)? "Bearer $accessToken":"";
  }
  validateResponse(Response response){
    switch(response.statusCode){
      case 200:
      case 201:
        return response.data;
      case 400:
      case 401:
        throw Exception(response.data["error"]).toString();
      case 500:
        throw Exception("Error en el servidor ${response.statusCode.toString()}");
    }
  }
}