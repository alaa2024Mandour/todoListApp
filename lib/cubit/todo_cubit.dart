import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/data/models/todo_model.dart';

class TodoCubit extends Cubit<List<TodoModel>>{
  final Box<TodoModel> todoBox;
  TodoCubit(this.todoBox) : super([]){
    loadTodo();
  }

  void loadTodo(){
    if(todoBox.isNotEmpty){
      emit(todoBox.values.toList());
    }
  }

  void addTodo(String title){
    var newTask = TodoModel(task: title, isCompleted: false);
    todoBox.add(newTask);
    emit([...state,newTask]);
  }

  void updateTodo(int index){
    state[index].isCompleted = ! state[index].isCompleted;
    todoBox.putAt(index, state[index]);
    emit([...state]);
  }

  void deleteTodo(int index){
    todoBox.delete(index);
    emit([...state..removeAt(index)]);
  }
}