import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    var arr = [
      Todo(
        id: uuid.v4(),
        title: 'Todo 1',
        description: 'Todo 1 Description',
        isDone: true,
      ),
      Todo(
        id: uuid.v4(),
        title: 'Todo 2',
        description: 'Todo 2 Description',
      ),
      Todo(
        id: uuid.v4(),
        title: 'Todo 3',
        description: 'Todo 3 Description',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return StatefulBuilder(
            builder: (context, _setState) {
              var todoItem = arr[index];
              return Dismissible(
                key: Key(todoItem.id),
                child: CheckboxListTile(
                  onChanged: (state) {
                    _setState(() {
                      todoItem.isDone = state;
                    });
                  },
                  value: todoItem.isDone,
                  title: Text(todoItem.title),
                ),
              );
            },
          );
        },
        itemCount: arr.length,
      ),
    );
  }
}
