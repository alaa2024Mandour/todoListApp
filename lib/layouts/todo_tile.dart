import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {

  final bool isCompleted;
  final String taskName;
  final Function (bool?) ? onchange;

const TodoTile({super.key,
  required this.isCompleted,
  required this.onchange,
  required this.taskName
});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade500,
        borderRadius: BorderRadius.circular(12),
      ),
      child:  Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
                value: isCompleted ,
                onChanged: onchange,
            ),

            Text(taskName,
            style:  TextStyle(
                fontSize: 16,
              decoration: isCompleted? TextDecoration.lineThrough : TextDecoration.none,
            ),
            )
          ],
        ),
      ),
    );
  }
}
