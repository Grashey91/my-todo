import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_todo/utils/dialog_box.dart';
import 'package:my_todo/utils/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // text controler
  final _controller = TextEditingController();

  // todo list
  List<Map<String, dynamic>> toDoList = [
    {"task": "Coding", "taskCompleted": true},
    {"task": "Do Exercise", "taskCompleted": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Text(
          'M y T o d o',
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: toDoList[index]['task'],
              taskCompleted: toDoList[index]['taskCompleted'],
              onChanged: (value) => checkboxChanged(value, index));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewTask(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index]['taskCompleted'] = !toDoList[index]['taskCompleted'];
    });
  }

  void createNewTask() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: () => saveNewTask(),
            onCancel: () => Navigator.of(context).pop(),
          );
        },
      );
    });
  }

  saveNewTask() {
    setState(() {
      toDoList.add({"task": _controller.text, "taskCompleted": false});
    });
    _controller.clear();
    Navigator.of(context).pop();
  }
}
