import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_10/controller/studentdata_controller.dart';
import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/database/db_model.dart';
import 'package:sqflite_10/screen/editstudent.dart';
import 'package:sqflite_10/screen/studentdetails.dart';

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    studentController.intialize();
    return Obx(() => studentController.studentList.isEmpty
        ? const Center(child: Text('no data found'))
        : ListView.builder(
            itemCount: studentController.studentList.length,
            itemBuilder: (context, index) {
              final student = studentController.studentList[index];

              return Card(
                color: Colors.lightBlue[50],
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      File(student.imagex),
                    ),
                  ),
                  title: Text(student.name),
                  subtitle: Text(
                    "Class: ${student.classname}",
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          Get.to(() => EditScreen(student: student));
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          deletestudent(context, student);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.to(
                      () => StudentDetails(stdetails: student),
                    );
                  },
                ),
              );
            },
          ));
  }

  void deletestudent(ctx, StudentModel student) {
    Get.defaultDialog(
        title: 'Delete',
        content: const Text('Do You Want delete the list ?'),
        actions: [
          TextButton(
            onPressed: () {
              detectedYes(ctx, student);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('No'),
          ),
        ]);
  }

  void detectedYes(ctx, StudentModel student) {
    deleteStudent(student.id!);
    Get.back();
    Get.snackbar(
      "Student Record",
      "Successfully Deleted",
      backgroundColor: Colors.redAccent,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
    );
    Get.back();
  }
}
