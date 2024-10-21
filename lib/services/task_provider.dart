import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/models/tasks.dart';

class TaskNotifier extends StateNotifier<List<Tasks>>{
  TaskNotifier() : super([]);


  void addTask(Tasks task){
    state = [...state, Tasks(id: task.id, title: task.title, description: task.description, deadlineDate: task.deadlineDate)];
  }

  void toggleComplete(int index) {
    final task = state[index];
    final updatedTask = Tasks(
      id: task.id,
      title: task.title,
      description: task.description,
      deadlineDate: task.deadlineDate,
      isCompleted: !task.isCompleted,
    );

    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) updatedTask else state[i],
    ];
  }

  void deleteTask(int index){
    state = [...state]..removeAt(index);
  }

}

  final taskNotifierProvider = StateNotifierProvider<TaskNotifier, List<Tasks>>((ref) => TaskNotifier());



