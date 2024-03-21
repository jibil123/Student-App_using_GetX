// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_10/controller/edit_controller.dart';
import 'package:sqflite_10/database/db_model.dart';

class EditScreen extends StatelessWidget {
  StudentModel student;
   EditScreen({super.key,
  required this.student});
  final editcontroller = Get.find<EditController>();
  @override
  Widget build(BuildContext context) {
    editcontroller.initialValues(
      name: student.name,
      classname: student.classname,
      imagePaths: student.imagex,
      quardianname: student.father,
      mobilename: student.pnumber
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
        actions: [
          IconButton(
            onPressed: () {
             editcontroller. editstudentclicked(
                context,
               student,
              );
            },
            icon: const Icon(Icons.cloud_upload),
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: editcontroller.formKey, 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      InkWell(
                        onTap: () => editcontroller.editphoto(context),
                        child:
                        Obx(() =>  CircleAvatar(
                          backgroundImage: 
                               FileImage(File(editcontroller.updatedImagepath.value)),
                          radius: 80,
                        ),
                      ),)
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                     const SizedBox( width: 10),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: editcontroller.nameController,
                          decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [  
                     const SizedBox( width: 10), 
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller:editcontroller .classController,
                          decoration: InputDecoration(
                            labelText: "Class",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Class';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [    
                    const  SizedBox( width: 10), 
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller:editcontroller .guardianController,
                          decoration: InputDecoration(
                            labelText: "Parent",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Parent Name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                     const SizedBox( width: 10),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller:editcontroller .mobileController,
                          decoration: InputDecoration(
                            labelText: "Mobile",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Mobile';
                            } else if (value.length != 10) {
                              return 'Mobile number should be 10 digits';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
