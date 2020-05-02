import 'package:flutter/cupertino.dart';
import 'package:todoapp/taskmodel.dart';

class TodoModel extends ChangeNotifier{
  List<TaskModel> taskList = []; //contains all the task

  addTaskInList(){

    TaskModel taskModel = TaskModel('title ${taskList.length}', 'detail ${taskList.length}');
    taskList.add(taskModel);

    notifyListeners();
    //code to do
  }
}