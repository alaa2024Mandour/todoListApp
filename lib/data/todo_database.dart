import 'package:hive/hive.dart';
import 'package:todo_list_app/data/models/todo_model.dart';

class TodoDataBase {

  final myBox = Hive.box<TodoModel>("todoBox");

  void addTodo(TodoModel todoModel){
      myBox.add(todoModel);
  }

  void deleteTodo(int index){
      myBox.deleteAt(index);
  }

  void updateTodo(int index,TodoModel todoModel){
    myBox.putAt(index, todoModel);
  }

  List<TodoModel> getTodo(){
    return myBox.isNotEmpty ? myBox.values.toList() : [] ;
  }
}