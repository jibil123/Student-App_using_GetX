import 'package:get/get.dart';
import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/database/db_model.dart';

class StudentController extends GetxController{
  RxList<StudentModel>filterstudent=<StudentModel>[].obs;
  RxList<StudentModel>studentList=<StudentModel>[].obs;
  intialize()async{ 
    dynamic s1=getstudentdata();
    studentList.value=await s1;
  }
    getsearchdata(String query)async{
    await intialize();
    if(query.isEmpty){
      filterstudent.value=studentList;
    }else{
      List<StudentModel>s=studentList
      . where((element) =>
              element.name
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element.classname
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
          filterstudent.value=s;
    }
  }
}
final studentController=Get.find<StudentController>();