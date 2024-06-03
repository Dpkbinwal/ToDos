import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todos/constants/colors.dart';
import 'package:todos/model/todo_model.dart';

class TodoItem extends StatelessWidget {
  final TodoModel toDo;
  final onTodoChange ;
  final onDeleteItem;

  const TodoItem({required this.toDo,required this.onDeleteItem,required this.onTodoChange, super.key });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: (){
          print("Click on list todo item");
          onTodoChange(toDo);

        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        tileColor: Colors.white,
        leading: toDo.isDone? Icon(Icons.check_box,color: Colors.blue,): Icon(Icons.check_box_outline_blank),
        title:
        Text(toDo.todoText.toString(),

          style: TextStyle(fontSize: 16,
            fontWeight: FontWeight.w600,
            color: tdBlack,
        decoration: toDo.isDone ?  TextDecoration.lineThrough: null),),

          trailing: Container(
            padding: EdgeInsets.all(0),
            // margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5)
            ),
            child: IconButton(color: Colors.white,iconSize: 18,
            icon: Icon(Icons.delete), onPressed: () {
              print("delete");
              onDeleteItem(toDo.id);
              },
            ),
          ),
      ),
    );
  }
}
