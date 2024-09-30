
import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  final String task;

  @HiveField(1)
   bool isCompleted;
  
  TodoModel({
    required this.task,
    required this.isCompleted
});
}