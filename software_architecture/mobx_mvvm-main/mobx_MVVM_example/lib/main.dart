import 'package:flutter/material.dart';
import 'package:mobx_mvvm_example/main_store/main_state.dart';
import 'package:mobx_mvvm_example/view/post/post_form_page.dart';
import 'package:mobx_mvvm_example/view/post/post_listview.dart';
import 'package:provider/provider.dart';

import 'locator.dart';

void main() async{
  await setupLocator();
  runApp(Provider(create: (_)=>MainState(),child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Posts"),
      ),
      body: PostListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (_)=>PostFormPage()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
