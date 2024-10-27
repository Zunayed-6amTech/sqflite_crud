import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_crud/common/models/bindings/bindings.dart';
import 'package:sqflite_crud/features/home/screens/home_page.dart';
import 'package:sqflite_crud/helper/route_helper.dart';
import 'package:sqflite_crud/utils/app_contstants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppContstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        )),
        inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
      ),
      home: const HomePage(),
      initialBinding: ControllerBindings(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}