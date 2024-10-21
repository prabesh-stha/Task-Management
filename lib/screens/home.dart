import 'package:flutter/material.dart';
import 'package:task_management_app/screens/add_task.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask()));
          }, icon: const Icon(Icons.add))
        ],
      ),
      body: const Column(
        children: [
           Text("tasks")
        ],
      ),
    );
  }
}