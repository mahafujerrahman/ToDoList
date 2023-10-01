import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletedFunction;


  ToDoTile({
  super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deletedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
    child: Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
      children: [
        SlidableAction(
    onPressed: deletedFunction,
    icon: Icons.delete,
    backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(12),
    )
    ],
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.yellow,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
            children :[
             Checkbox(value: taskCompleted,
                  onChanged: onChanged,
               activeColor: Colors.red,
             ),
              Text(taskName,
                style: TextStyle(
                    decoration:taskCompleted
                    ? TextDecoration.lineThrough:TextDecoration.none,
                    fontWeight: FontWeight.bold,fontSize: 20),
            ),
            ]
        ),

      ),
    )
    );
  }
}
