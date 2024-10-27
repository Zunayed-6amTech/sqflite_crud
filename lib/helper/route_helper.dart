import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sqflite_crud/features/add_task/screens/add_task_screen.dart';
import 'package:sqflite_crud/features/home/screens/home_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String addTask = '/add-new-task';

  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=> const HomePage()),
    GetPage(name: addTask, page:()=> const  AddTaskScreen()),

  ];
}









// static String updateTask(bool isUpdating, Task task){
//   List<int> encodedData = utf8.encode(jsonEncode(task.toJson()));
//   String data = base64Encode(encodedData);
//   return '$addTask?updating=$isUpdating&task=$data';
// }

// GetPage(name: addTask, page: () {
//   Task? task;
//   bool isUpdating= false;
//   if(Get.parameters['task'] != null) {
//     task = Task.fromJson(jsonDecode(utf8.decode(base64Url.decode(Get.parameters['task']!.replaceAll(' ', '+')))));
//   }
//   if(Get.parameters['updating'] != null) {
//     isUpdating = Get.parameters['updating'] == 'true';
//   }
//   return AddTaskScreen(isUpdating: isUpdating, task: task,);
// }),