import 'dart:isolate';

import 'package:flutter/material.dart';

import 'generics_example.dart';
import 'isolate_exaple.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Isolates')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: Colors.red,),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text('Run Heavy Task'),
              onPressed:()=> onPress(),
            ),
          ],
        ),
      ),
    );
  }



  onPress() async {
    //Creamos nuestro ReceivePort para poder enviar y recibir datos entre Isolates
    final ReceivePort receivePort = ReceivePort();
    try {
      //en spawn enviamos nuestro tarea pesada y compartimos datos desde nuestro isolate principal
      await Isolate.spawn(IsolateExample.runHeavyTaskIWithIsolate, [receivePort.sendPort, 400]);

    } on Object {
      debugPrint('Isolate Failed');
      receivePort.close();
    }
    //Al finalizar el Isolate recibiremos una respuesta
    final response = await receivePort.first;

    print('Result: $response');
  }
}





