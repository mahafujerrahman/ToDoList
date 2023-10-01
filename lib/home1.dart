import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data.dart';
import 'package:todo/dialog_box.dart';
import 'package:todo/todo_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //hive Box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

@override
  void initState() {
  //create default data
  if (_myBox.get ('TODOLIST')==null){
    db.createInitialData();
  }else
    {
      db.loadData();
    }

    super.initState();
  }
  final _controller = TextEditingController();


  void checkBoxChanged (bool? value, int index){
    setState(() {
      db.todoList [index][1]=!db.todoList[index][1];
    });
    db.updateDataBase();
  }
  void saveNewTask(){
    setState(() {
      db.todoList.add([_controller.text,false]);
    });
    Navigator.of(context).pop();
    db.updateDataBase();

  }
void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel:() => Navigator.of(context).pop() ,
      );
    },
    );
}
void deleteTask (int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("To Do List - For Lamia"),
        elevation: 20,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add_task_sharp),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context , index){
          return ToDoTile(
              taskName:  db.todoList[index][0],
              taskCompleted:  db.todoList[index][1],
              onChanged:(value)=>checkBoxChanged(value , index),
              deletedFunction: (context)=> deleteTask(index) ,
          );
        },
      ),
    );
  }
}




