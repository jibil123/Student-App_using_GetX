
import 'package:get/get.dart';
import 'package:sqflite_10/controller/add_controller.dart';
import 'package:sqflite_10/controller/edit_controller.dart';
import 'package:sqflite_10/controller/studentdata_controller.dart';

class Intailization implements Bindings{
  @override
  void dependencies() {
   Get.put<Addcontroller>(Addcontroller());
   Get.put<EditController>(EditController());
   Get.put<StudentController>(StudentController());
  }
}