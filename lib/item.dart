import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskItem extends StatefulWidget {
  final String name;
  late bool isDone;
  late String dueDate;

  TaskItem({super.key, 
    required this.name,
    required this.dueDate,
    this.isDone = false,
  });
  
  @override
  State<TaskItem> createState() => _TaskItemState();
  
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
  }

  class _TaskItemState extends State <TaskItem>{
  late bool isDone;  
  get onToggle => isDone = true;

  @override
  void initState() {
    super.initState();
    isDone = widget.isDone; 
  }

  @override
  Widget build(BuildContext context){
  return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Checkbox(
            value: isDone,
            onChanged: (bool? value){
              setState(() {
                isDone = value ?? false;
              });
            }
          ),
          SizedBox(width: 10), 
          Expanded(
            child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 16,
                color: isDone ? Colors.white : Colors.black,
                decoration: isDone ? TextDecoration.lineThrough : null,
                
              ),
            ),
          ),
          Expanded(child: Text(widget.dueDate),)
        ],
      ),
    );
  } 


  }



