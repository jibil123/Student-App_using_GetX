import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/database/db_model.dart';


class EditController extends GetxController{
    RxString updatedImagepath="".obs;

  final formKey = GlobalKey<FormState>(); 

  final nameController = TextEditingController();
  final classController = TextEditingController();
  final guardianController = TextEditingController();
  final mobileController = TextEditingController();


  void initialValues({
    required String imagePaths,
    required String name,
    required String classname,
    required String quardianname,
    required String mobilename,
  }) {
    updatedImagepath.value = imagePaths;
    nameController.text = name;
    classController.text = classname;
    guardianController.text = quardianname;
    mobileController.text = mobilename;
  }


  Future<void> geterimage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    editcontroller  .updatedImagepath.value = image.path.toString();
    
  }

  Future<void> editstudentclicked(
      BuildContext context, StudentModel student) async {
    if (formKey.currentState!.validate()) {
      final name = editcontroller.nameController.text.toUpperCase();
      final classA = editcontroller.classController.text.toString().trim();
      final father = editcontroller.guardianController.text;
      final phonenumber = editcontroller.mobileController.text.trim();

      final updatedStudent = StudentModel(
        id: student.id,
        name: name,
        classname: classA,
        father: father,
        pnumber: phonenumber,
        imagex: updatedImagepath.value,
      );

      await editStudent(
        student.id!,
        updatedStudent.name,
        updatedStudent.classname,
        updatedStudent.father,
        updatedStudent.pnumber,
        updatedStudent.imagex,
      );
      getstudentdata();

      Get.back();
    }
  }

  void editphoto(ctxr) {
    showDialog(
      context: ctxr,
      builder: (ctxr) {
        return AlertDialog(
          title: const Text('Update Photo '),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                   const Text('Choose from camera'),
                    IconButton(
                      onPressed: () {
                        geterimage(ImageSource.camera);
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                   const Text('Choose from gallery '),
                    IconButton(
                      onPressed: () {
                        geterimage(ImageSource.gallery);
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.image,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

}
final editcontroller =Get.find<EditController>();