import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/screens/add_task.dart';
import 'package:task_management_app/services/task_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, WidgetRef ref, child){
      final tasks = ref.watch(taskNotifierProvider);
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
      body:  Column(
        children: [
           Expanded(child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Dismissible(key: Key(task.id),
              background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                ref.read(taskNotifierProvider.notifier).deleteTask(index);
              } ,
               child: ListTile(
                title: Text(task.title),
                subtitle: Text(task.description),
                trailing: IconButton(
                  icon: Icon(task.isCompleted ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined),
                  onPressed: () => ref.read(taskNotifierProvider.notifier).toggleComplete(index)),
              )
              
              );
            }))
        ],
      ),
    );
    });
  }
}