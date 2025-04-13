import 'package:flutter/material.dart';

import 'build_item.dart';



class Generator extends StatelessWidget {
  final List tasks;

  const Generator({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    if (tasks.isNotEmpty) {
      //return BuildItem(model: tasks[1],);
      return ListView.separated(
          itemBuilder: (context, index) => BuildItem(model: tasks[index],),
          separatorBuilder: (context, index) => SizedBox(height: 20.0,),
          itemCount: tasks.length,
      );
    }
    else {
      return Center(child: Text(
        'No Contacts',
        style: TextStyle(
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
          color: Colors.grey[300],
        ),
      ),);
    }
  }
}
