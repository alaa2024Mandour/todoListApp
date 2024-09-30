import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {


  var taskController = TextEditingController();
  VoidCallback onSave;
  VoidCallback onCancel;

  var _formKey = GlobalKey<FormState>();


  ShowDialog({
    required this.onCancel,
    required this.onSave,
    required this.taskController,
});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade900,
      content: Form(
        key: _formKey,
        child: TextFormField(
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
          validator: (value){
            if(value==null || value.isEmpty){
              return "Please Enter Your Task";
            }else{
              return null;
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
              if(_formKey.currentState?.validate()==true){
                onSave();
              }
            },
            child: Text("Save")),
      ],
      actionsAlignment:MainAxisAlignment.center,
    );
  }
}
