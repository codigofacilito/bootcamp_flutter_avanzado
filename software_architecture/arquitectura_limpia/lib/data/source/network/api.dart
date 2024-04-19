import 'package:dio/dio.dart';

/*Nosotros nos conectaremos en el api con la url base y tambien definiremos los metodos http
get - Obtener datos
post - Crear
Put - Modificar un objeto completo
patch - Modificar pero un dato de un objeto completo
delete - Eliminar
* */
class Api{
  late Dio dio;
  Api(){
    dio = Dio(
      BaseOptions(
        baseUrl: "https://rickandmortyapi.com/api/",
        connectTimeout: const Duration(seconds: 30000),
        receiveTimeout: const Duration(seconds: 30000),
        validateStatus: (status){
          return true;
        }
      )
    );
  }
  Future<Map<String,dynamic>> get(String endpoint)async{
    try{
      final Response response = await dio.get(endpoint);
      final Map<String,dynamic> responseData = validateRResponse(response);
      return responseData;
    }on DioException catch(error){
      throw Exception("Error interno $error");
    }
  }

  Future<Map<String,dynamic>> post(String endpoint,Map<String,dynamic> body)async{
    try{
      final Response response = await dio.post(endpoint,data: body
      );
      final Map<String,dynamic> responseData = validateRResponse(response);
      return responseData;
    }on DioException catch(error){
      throw Exception("Error interno $error");
    }
  }

  //Validamos la respuesta del servidor para validar si hay algun error o recibimos los datos.
  Map<String,dynamic> validateRResponse(Response response){
    switch(response.statusCode){
      case 200:
      case 201:
        return response.data as Map<String, dynamic>;
      case 400:
      case 401:
        throw Exception(response.data["error"]).toString();
      case 500:
      default:
        throw Exception("Error en el servidor ${response.statusCode.toString()}");
    }
  }
}