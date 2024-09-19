import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {


  var taskController = TextEditingController();
  VoidCallback onSave;
  VoidCallback onCancel;


  ShowDialog({
    required this.onCancel,
    required this.onSave,
    required this.taskController,
});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade900,
      content: TextField(
        controller: taskController,
        style: const TextStyle(
          color: Colors.white
        ),
        decoration: InputDecoration(
          label:const Text(
            "Add a new task",
            style: TextStyle(
              color: Colors.white
            ),
          ) ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.white, width: 2),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: (){
              onCancel();
            },
            child: Text("Cancel")),

        ElevatedButton(
            onPressed: (){
              onSave();
            },
            child: Text("Save")),
      ],
      actionsAlignment:MainAxisAlignment.center,
    );
  }
}
