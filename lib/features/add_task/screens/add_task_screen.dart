import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_crud/common/models/task.dart';
import 'package:sqflite_crud/features/home/controllers/home_controller.dart';
import 'package:sqflite_crud/helper/database_helper.dart';
import 'package:sqflite_crud/utils/app_contstants.dart';
import 'package:sqflite_crud/utils/dimensions.dart';

class AddTaskScreen extends StatefulWidget {
  final bool isUpdating;
  final Task? task;
  const AddTaskScreen({super.key, this.isUpdating=false, this.task});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final databaseHelper = DatabaseHelper();
  
  TextEditingController textController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    if(widget.isUpdating) textController.text = widget.task?.content ?? '';
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(title: const Text(AppContstants.addNewTask)),
    body: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault), child: Column(children: [

      TextField(
        controller: textController,
        decoration: const InputDecoration(hintText: AppContstants.addTaskHint),
        ),
      ]),
     ),

     bottomNavigationBar: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
       child: SizedBox(width: double.infinity, child:
       ElevatedButton(
         onPressed: ()=> addOrEditTask(),
         child: Text(widget.isUpdating ? AppContstants.editTask : AppContstants.addTask),
        ),
       ),
      ),
    );
  }

  void addOrEditTask(){
    if(textController.text.isEmpty || textController.text == '') return;
      
      widget.isUpdating ? databaseHelper.updateTaskContent(widget.task?.id ?? 0, textController.text.trim())
                        : databaseHelper.addTask(textController.text.trim());
      
      textController.clear();
      Get.find<HomeController>().getTaskList();
      Get.back();
  }
  
  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }
}