import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/todoModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: ChangeNotifierProvider(
       create: (context) => new TodoModel(),
       child: MyHomePage(),
     ),
      debugShowCheckedModeBanner: false,
    );
  }

}
class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 400,
            height: 600,
            child: Image.asset('images/todopic.jpg',fit: BoxFit.contain,),
          ),
          Positioned(
              top: 60,
              left: 20,
              child: Text('Todos',style: TextStyle(fontSize: 40, color: Colors.blueGrey,fontWeight: FontWeight.bold),)),
          DraggableScrollableSheet(
            maxChildSize: 0.85,
            builder: (BuildContext context, ScrollController scrollcontroller){
              return Stack(
                overflow: Overflow.visible,
                children: <Widget>[
               Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
              ),
              child: Consumer<TodoModel>(
                builder: (context, todo, child){
                  return ListView.builder(
                    itemCount: todo.taskList.length,
                    itemBuilder: (context, index){
                    return ListTile(
                      title: Text('Title: ${todo.taskList[index].title}',style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.bold),),
                      subtitle: Text('Detail of the task No ${todo.taskList[index].detail}',style: TextStyle(color: Colors.grey[700]),),
                      leading: Icon(Icons.check_circle, color: Colors.greenAccent,),
                      isThreeLine: true,
                    );
                  },
                    controller: scrollcontroller,


                  );
                },
              ),
              ),
                  Positioned(
                    child: FloatingActionButton(
                      child: Icon(Icons.add, color: Colors.white,),
                      backgroundColor: Colors.pinkAccent,
                      onPressed: (){

                        Provider.of<TodoModel> (context, listen: false).addTaskInList();
                      },
                    ),
                    top: -10,
                    right: 30,
                  ),
                ],
              );
            },
          ),
        ],
        ),
      backgroundColor: Colors.deepPurple[600],
    );
  }
}




