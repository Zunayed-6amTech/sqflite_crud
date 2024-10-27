import 'package:get/get.dart';
import 'package:sqflite_crud/features/home/controllers/home_controller.dart';

class ControllerBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> HomeController());
    //Get.lazyPut(()=> AddTaskController());
  }
}