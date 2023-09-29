import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todolist/model/item.dart';
import 'package:flutter_todolist/widget/card_body.dart';
import 'package:flutter_todolist/widget/modal_bottom.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
  runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false
  ));
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Item> item = [
    Item(1, 'Washing Dishes'),
    Item(2, 'Doing Laundry'),
    Item(3, 'Taking Note'),
    Item(4, 'Checking Email')
  ];

  void _clickAddTask(String name){
    setState(() {
      item.add(Item(Random().nextInt(99999), name));
    });
  }

  void _clickDeleteTask(int id){
    setState(() {
      item.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Todo: AppBar
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          title: const Text('ToDoList',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        //Todo: FloatingActionButton
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showModalBottomSheet(
              backgroundColor: const Color(0xFFDFDFDF),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))
              ),
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context){
              return ModalBottom(addTask: _clickAddTask);
            });
          },
          child: const Icon(
            Icons.add,
            size: 50,),
        ),

        //TODO: Body chính của app
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
              left: 31, right: 31, top: 30, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: item.map((e) => CardBody(item: e,
              deleteTask: _clickDeleteTask,
              index: item.indexOf(e))).toList(),
          ),
        )
    );
  }
}






