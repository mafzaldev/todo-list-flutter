import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../constants/colors.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final onToDoChange;
  final onDeleteItem;

  const TodoItem(
      {Key? key,
      required this.todo,
      required this.onToDoChange,
      required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 15),
        child: ListTile(
          onTap: () {
            onToDoChange(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBlue,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Container(
            width: 40,
            height: 40,
            child: IconButton(
              color: tdRed,
              iconSize: 25,
              icon: Icon(Icons.delete),
              onPressed: () {
                onDeleteItem(todo.id);
              },
            ),
          ),
        ));
  }
}
