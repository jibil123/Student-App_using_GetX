import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/screen/addstudent.dart';
import 'package:sqflite_10/screen/listscreeen.dart';
import 'package:sqflite_10/screen/searchscreen.dart';

class HomeScreeen extends StatelessWidget {
  const HomeScreeen({super.key});

  @override
  Widget build(BuildContext context) {
      getstudentdata();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'Students Record',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(()=>const SeachScreen());
              },
              icon: const Icon(Icons.search_rounded,color: Colors.black,))
        ],
      ),
      body:const Column(
        children: [
          Expanded(
               child: StudentList()),
        ],
      ),
      floatingActionButton: Visibility(
        visible: true, // Show the add button
        child: FloatingActionButton(
          backgroundColor: Colors.yellow,
          shape:const CircleBorder(),
          onPressed: () {
            addstudent(context);
          },
          child:const Icon(Icons.add,),
        ),
      ),
      
    );
  }
  void addstudent(ctx) {
    Navigator.of(ctx)
        .push(MaterialPageRoute(builder: (ctx) => const AddStudentdata()));
  }
}
