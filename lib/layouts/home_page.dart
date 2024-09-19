
import 'package:flutter/material.dart';
import 'package:todo_list_app/layouts/show_dialog.dart';
import 'package:todo_list_app/layouts/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todTasks=[
    ["Do Exercise",
      true,
    ],

    ["Go To The Gym",
      false,
    ],

    ["Flutter Meeting",
      true,
    ],
  ];

  void onCheckBoxChanged(bool?value,int index){
    setState(() {
      todTasks[index][1]=!todTasks[index][1];
    });
  }

  void showTaskDialog(){
    setState(() {
     showDialog(
         context: context,
         builder: (BuildContext context) => ShowDialog(onCancel:onCancelDialog, onSave:onSaveDialog, taskController: controller,) );
    });
  }

  var controller = TextEditingController();

  onCancelDialog(){
    controller.clear();
    Navigator.pop(context);
  }

  onSaveDialog(){
    setState(() {
      todTasks.add([controller.text,false]);
    });
    controller.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
  backgroundColor: Colors.grey.shade900,
  title: const Text(
    "TodoApp",
    style: TextStyle(
      color: Colors.white
    ),
  ),
),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: todTasks.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Dismissible(
                key: Key(todTasks[index].toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction){
                  setState(() {
                    todTasks.removeAt(index);
                  });
                },
                child: TodoTile(
                  taskName: todTasks[index][0],
                  isCompleted: todTasks[index][1],
                  onchange: (newVal) => onCheckBoxChanged(newVal, index),
                  ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          return showTaskDialog();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.grey.shade900,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
