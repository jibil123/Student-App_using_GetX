
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_10/controller/add_controller.dart';

class AddStudentdata extends StatelessWidget {
  const AddStudentdata({super.key});

  @override
  Widget build(BuildContext context) {
    addcontroller.Intailization();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Add Student'),
        actions: [
          IconButton(
            onPressed: () {
            addcontroller. addstudentclicked(context);
            },
            icon: const Icon(Icons.save_alt_outlined),
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key:addcontroller.formKey, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Obx(() => 
                    CircleAvatar(
                        backgroundImage: addcontroller.imagepath.value.isNotEmpty
                            ? FileImage(File(addcontroller.imagepath.value))
                            : const AssetImage('assets/profile.png')
                                as ImageProvider,
                        radius: 99),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 5,
                      child: IconButton(
                        onPressed: () {
                        addcontroller.  addphoto(context);
                        },
                        icon: const Icon(Icons.camera_alt),
                        color: Colors.white,
                        iconSize: 40,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  controller: addcontroller.nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: 'enter name',
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
                const SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  controller:addcontroller .classController,
                  decoration: InputDecoration(
                    labelText: "Class",
                    hintText: 'enter class',
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
                const SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  controller:addcontroller .guardianController,
                  decoration: InputDecoration(
                    labelText: "Guardian",
                    hintText: 'enter Guardian name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                   
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Guardian';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  controller: addcontroller.mobileController,
                  decoration: InputDecoration(
                    labelText: "Mobile",
                    hintText: 'Mobile Number',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
