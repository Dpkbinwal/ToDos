

// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todos/constants/colors.dart';
import 'package:todos/model/todo_model.dart';
import 'package:todos/screens/setting_screen.dart';
import 'package:todos/widgets/todoItem.dart';

class Home extends StatefulWidget {
    Home ({super.key});



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<TodoModel> todosList = TodoModel.todoList();
  List<TodoModel> _foundTodo =[];

  final _todoController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _foundTodo = todosList;
  }


  void _handleToDoChange( TodoModel todo){
    setState(() {
    todo.isDone = !todo.isDone;
    });
  }
  void _handleToDoDelete(String id){
    setState(() {
      todosList.removeWhere((item)=> item.id==id);
    });
  }

  void _addToDoItem(String toDo){
    setState(() {
    todosList.add(TodoModel(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo));

    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword){
    List<TodoModel> results=[];
    if(enteredKeyword.isEmpty){
      results=todosList;
    }
    else{
      results = todosList.where((item)=> item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {

      _foundTodo=results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        // elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 8,top: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:InkWell(
                    onTap: (){
                      print('object');

                    },
                    child: Image.asset('assets/images/profile.jpg'))
              ),
            )
          ],
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: tdGrey,
              ),
              child: Center(child: Text('T o D o   A p p' ,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900,color:Colors.white),
              )),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Setting'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
               Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(

                    onChanged:(value)=> _runFilter(value),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        prefixIcon: Icon(Icons.search,
                          color: tdBlack,
                          size: 20,),
                        prefixIconConstraints:BoxConstraints(
                            maxHeight: 20,
                            minWidth: 25),
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(color:tdGrey)
                    ),

                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40,bottom: 15),
                        child: Text('All ToDos', style:TextStyle(fontWeight:FontWeight.w900,fontSize: 25)),
                      ),
                      for(TodoModel todo in _foundTodo.reversed)
                        TodoItem( toDo: todo, onTodoChange: _handleToDoChange,onDeleteItem: _handleToDoDelete,),
                    ],
                  ),
                ),

              ],
            ),
          ),
          Align(

            alignment: Alignment.bottomCenter,

            child: Row(

              children: [
                Expanded(child: Container(
                  margin: EdgeInsets.only(bottom: 20,right: 10,left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  decoration: BoxDecoration(
                    color:Colors.white,
                      borderRadius: BorderRadius.circular(20),

                    boxShadow: [BoxShadow(

                      color: Colors.grey,
                      offset: Offset(0.0,0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,

                    )]
                  ),
                  child: TextField(

                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Add a new Todo item',
                      border: InputBorder.none,


                    ),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 20,right: 20),
                  child: ElevatedButton(
                    child: Text('+',style: TextStyle(fontSize: 40),),
                    onPressed: (){
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(60, 60),
                      elevation: 10,
                      backgroundColor:Colors.white
                    )
                  ),
                )

              ],
            ),
          ),


        ],
      ),
    );
  }
}

Widget searchBox(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(


      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search,
            color: tdBlack,
            size: 20,),
          prefixIconConstraints:BoxConstraints(
              maxHeight: 20,
              minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color:tdGrey)
      ),

    ),
  );
}


Widget pop(){
  return
    Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 200,
        height: 100,
        margin: EdgeInsets.only(right: 30),
        padding: EdgeInsets.all(10),
        color: Colors.pink,
        child: Column(
          children: [
            Text('hii'),
            Text('hii'),
            Text('hii'),
          ],
        ),
      ),
    );
}
