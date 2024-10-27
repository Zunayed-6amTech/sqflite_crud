import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_crud/common/models/task.dart';

class DatabaseHelper {
  
  static Database? _db;
  
  final String _taskTableName = "task";
  final String _taskIdColumnName = "id";
  final String _taskContentColumnName = "content";
  final String _taskStatusColumnName = "status";

  Future<Database> get database async{
    if(_db != null) return _db!;
    return await getDatabase();
  }

  Future<Database> getDatabase() async {

    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "crud.db");
    
    return openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version ){
        db.execute(
          '''
          CREATE TABLE $_taskTableName(
           $_taskIdColumnName INTEGER PRIMARY KEY,
           $_taskContentColumnName TEXT NOT NULL,
           $_taskStatusColumnName INTEGER NOT NULL)
          '''
        );
      }
    );
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final data = await db.query(_taskTableName);
    
    final List<Task> tasks = data.map((t)=> Task(
      id: t["id"] as int, 
      status: t["status"] as int, 
      content: t["content"] as String)).toList();
    
    return tasks;
  }

  void addTask(String content) async {
    final db = await database;
    
    await db.insert(_taskTableName, 
    {
      _taskContentColumnName: content,
      _taskStatusColumnName: 0
    } 
   );
   log("task added: $content");
  }

void updateTaskContent(int id, String content) async {
  final db = await database;
  
  await db.update(_taskTableName, 
  {
    _taskContentColumnName: content,
  },
  where: "id = ?",
  whereArgs: [id],
  );
  log("task status updated");
 }

 void updateTaskStatus(int id, int status) async {
  final db = await database;

  await db.update(_taskTableName,
  {
    _taskStatusColumnName: status,
  },
  where: "id = ?",
  whereArgs: [id],
  );
  log("task status updated");
 }

 void deleteTask(int id) async {
  final db = await database;
  
  await db.delete(
    _taskTableName,
    where: "id = ?",
    whereArgs:  [id],
  );
 log("task deleted");
 }

}