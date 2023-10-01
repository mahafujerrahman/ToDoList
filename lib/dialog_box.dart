import 'package:flutter/material.dart';
import 'package:todo/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBox({super.key,

     required this.controller,
     required this.onSave,
     required this.onCancel,

   });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller ,
              decoration:
              InputDecoration(
                border: OutlineInputBorder(
                ),
                hintText: "Add Your Task",
              ) ,
            ),Padding(padding: EdgeInsets.all(5)),

            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text:' Save',
                    onPressed:onSave),
                Padding(padding: EdgeInsets.only(left: 55,bottom: 50)),
                MyButton(text: ' Cancel',
                    onPressed:onCancel),
              ],
            )
          ],
        ),
      )
    );
  }
}
