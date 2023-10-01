import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List todoList =[];

  final _myBox = Hive.box('mybox');

  void createInitialData (){
    todoList=[
      ['Make List',false],
      ['Make List Today',false],
    ];
  }
  void loadData (){
   todoList = _myBox.get ('TODOLIST');
  }
  void updateDataBase(){
    _myBox.put("TODOLIST", todoList);
  }
}