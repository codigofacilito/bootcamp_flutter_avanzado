// We declare a top level function here for an isolated callback function

import 'dart:isolate';

class IsolateExample{

  //Creamos nuestra tarea pesada
  static int runHeavyTaskIWithIsolate(List<dynamic> args) {
    //Recivimos la bandera para poder renviar los valores al Isolate proncipal
    SendPort resultPort = args[0];
    //Ejecutamos el metodo pesado
    int value = runHeavyTaskWithOutIsolate(args[1]);
    //Una vez que terminemos la operacion regresaremos al Isolate principal con el resultado calculado.
    Isolate.exit(resultPort, value);
  }

  //4000000000
  //En esta funcion vamos a sumar 4 mill millones de veces
 static int runHeavyTaskWithOutIsolate(int count) {
    int value = 0;
    for (var i = 0; i < count; i++) {
      value += i;
    }
    print(value);
    return value;
  }
}


