import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_crud/common/models/task.dart';
import 'package:sqflite_crud/features/add_task/screens/add_task_screen.dart';
import 'package:sqflite_crud/features/home/controllers/home_controller.dart';
import 'package:sqflite_crud/helper/database_helper.dart';
import 'package:sqflite_crud/helper/route_helper.dart';
import 'package:sqflite_crud/utils/app_contstants.dart';
import 'package:sqflite_crud/utils/dimensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().getTaskList();
  }
  final databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text(AppContstants.myTask)),
      body: GetBuilder<HomeController>(
          builder: (controller) {
            return ListView.builder(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                itemCount: controller.tasks.length,
                itemBuilder: (context, index) {
                  Task task = controller.tasks[index];
                  return Card(child: ListTile(
                    leading: Checkbox(value: task.status==1, onChanged: (value){
                      controller.updateTaskStatus(task.id, value);
                    }),
                    title: Text(task.content),
                    trailing: IconButton(
                      onPressed: ()=> controller.deleteTask(task.id),
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                    onTap: () {
                      Get.to(()=> AddTaskScreen(isUpdating: true, task: task));
                     },
                   ),
                 );
               }
             );
          }
        ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Get.toNamed(RouteHelper.addTask);
        },
      ),
    );
  }
}