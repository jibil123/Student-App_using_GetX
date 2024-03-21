import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_10/controller/studentdata_controller.dart';
import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/database/db_model.dart';
import 'package:sqflite_10/screen/editstudent.dart';
import 'package:sqflite_10/screen/studentdetails.dart';

class SeachScreen extends StatelessWidget {
  const SeachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    studentController.getsearchdata("");
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                onChanged: (value) => studentController.getsearchdata(value),
                decoration: const InputDecoration(
                  labelText: 'Search',
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Expanded(child: Obx(() {
              if (studentController.filterstudent.isEmpty) {
                return const Center(
                  child: Text('NO Result Found'),
                );
              } else {
                return ListView.builder(
                  itemCount: studentController.filterstudent.length,
                  itemBuilder: (context, index) {
                    final finduserItem = studentController.filterstudent[index];
                    return Card(
                      color: const Color.fromARGB(255, 160, 207, 246),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: FileImage(File(finduserItem.imagex)),
                        ),
                        title: Text(finduserItem.name),
                        subtitle: Text('CLASS : ${finduserItem.classname}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                Get.to(() => EditScreen(student: finduserItem));
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                deletestudent(context, finduserItem);
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          Get.to(() => StudentDetails(stdetails: finduserItem));
                        },
                      ),
                    );
                  },
                );
              }
            })),
          ],
        ),
      )),
    );
  }

  void deletestudent(ctx, StudentModel student) {
    showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Do You Want delete the list ?'),
          actions: [
            TextButton(
              onPressed: () {
                detectedYes(context, student);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void detectedYes(ctx, StudentModel student) {
    deleteStudent(student.id!);
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        content: Text("Successfully Deleted"),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.of(ctx).pop();
  }
}
