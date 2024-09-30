import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/data/models/todo_model.dart';
import 'package:todo_list_app/data/todo_database.dart';
import 'package:todo_list_app/layouts/show_dialog.dart';
import 'package:todo_list_app/layouts/todo_tile.dart';

import '../cubit/todo_cubit.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  void showTaskDialog(BuildContext context){
     showDialog(
         context: context,
         builder: (BuildContext context) => ShowDialog(
           onCancel:() => onCancelDialog(context),
           onSave:() => onSaveDialog(context),
           taskController: controller,) );
  }

  var controller = TextEditingController();

  onCancelDialog(BuildContext context){
    controller.clear();
    Navigator.pop(context);
  }

  onSaveDialog(BuildContext context){
    context.read<TodoCubit>().addTodo(controller.text);
    controller.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text(
    "TodoApp",
    style: TextStyle(
      color: Colors.white
    ),
  ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context,"/SettingScreen" );
              },
              icon: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.settings),
                ),
              ))
        ],
),
      body:BlocBuilder<TodoCubit,List<TodoModel>>
        (
          builder: (BuildContext context, todoList){
            var todoCubit = context.read<TodoCubit>();
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Dismissible(
                      key: Key(todoList[index].toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction){
                          todoCubit.deleteTodo(index);
                      },
                      child: TodoTile(
                        taskName:todoList[index].task,
                        isCompleted: todoList[index].isCompleted,
                        onchange: (newVal) => (todoCubit.updateTodo(index)),
                      ),
                    ),
                  );
                },
              ),
            );
          }

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          return showTaskDialog(context);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
