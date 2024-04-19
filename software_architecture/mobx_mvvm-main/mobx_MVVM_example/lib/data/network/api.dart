import 'package:dio/dio.dart';

class Api {
  late Dio dio;
  Api(){
    dio = Dio(
      BaseOptions(
        baseUrl: "https://my-json-server.typicode.com/Marines0210/consumirServicios",
        connectTimeout:  const Duration(seconds: 30000),
        receiveTimeout:  const Duration(seconds: 30000),
      )
    );
  }

  Future get(String endpoint)async {
    try{
      final Response response = await dio.get(endpoint);
      return validateResponse(response);
    }on DioException catch(error){
      throw Exception("Error interno $error");
    }
  }

  Future post(String endpoint,Map body)async {
    try{
      final Response response = await dio.post(endpoint,data: body);
      return validateResponse(response);
    }on DioException catch(error){
      throw Exception("Error interno $error");
    }
  }

  Future put(String endpoint,Map body)async {
    try{
      final Response response = await dio.put(endpoint,data: body);
      return validateResponse(response);
    }on DioException catch(error){
      throw Exception("Error interno $error");
    }
  }

  Future delete(String endpoint)async {
    try{
      final Response response = await dio.delete(endpoint);
      return validateResponse(response);
    }on DioException catch(error){
      throw Exception("Error interno $error");
    }
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
      default:
        throw Exception("Error en el servidor ${response.statusCode.toString()}");
    }
  }
}