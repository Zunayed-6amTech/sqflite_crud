import 'package:get/get.dart';
import 'package:sqflite_crud/common/models/task.dart';
import 'package:sqflite_crud/helper/database_helper.dart';

class HomeController extends GetxController{

  List<Task> tasks = [];
  DatabaseHelper databaseHelper = DatabaseHelper();

  void getTaskList() async {
    tasks = await databaseHelper.getTasks();
    update();
  }

  void updateTaskStatus(int id,value){
    databaseHelper.updateTaskStatus(id, value==true?1:0);
    getTaskList();
  }

  void deleteTask(int id){
    databaseHelper.deleteTask(id);
    getTaskList();
  }
}

