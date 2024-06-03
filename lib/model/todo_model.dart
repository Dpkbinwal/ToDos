
class TodoModel{
  String? id;
  String? todoText;
  bool isDone;

  TodoModel({required this.id,required this.todoText, this.isDone=false});

  static List<TodoModel> todoList(){
    return [
      TodoModel(id: '01', todoText: 'Morning exercise', isDone: true),
      TodoModel(id: '02', todoText: 'Water ', isDone: true),
      TodoModel(id: '04', todoText: ' Study'),
      TodoModel(id: '03', todoText: 'Evening exercise'),
    ];
  }

}