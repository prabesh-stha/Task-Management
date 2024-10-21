import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/models/tasks.dart';
import 'package:task_management_app/screens/date_picker.dart';
import 'package:task_management_app/screens/home.dart';
import 'package:task_management_app/services/task_provider.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime? _selectedDate;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
        centerTitle: true,
        backgroundColor: Colors.grey[500],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  prefixIcon: Icon(Icons.title_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  )
                ),
              ),
              const SizedBox(height: 16,),

              TextFormField(
                controller: _descController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: "Description",
                  prefixIcon: Icon(Icons.description_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  )
                ),
                
              ),
              const SizedBox(height: 16,),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: _selectedDate == null ? "Select a date for deadline" : "${_selectedDate!.toLocal()}",
                  prefixIcon: const Icon(Icons.calendar_month_rounded),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  )
                ),
              ),

              DatePicker(title: _selectedDate==null ? "Select a deadline date" : "Update the deadline date",onDateSelected: (date){
                setState(() {
                  _selectedDate = date;
                });
              }),
              const SizedBox(height: 16,),

              Consumer(builder: (context, WidgetRef ref, child){
                return ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white
              ),
              onPressed: (){
                final title = _titleController.text.trim();
                final desc = _descController.text.trim();
                final task = Tasks(id: title[0], title: title, description: desc, deadlineDate: _selectedDate!);
                ref.read(taskNotifierProvider.notifier).addTask(task);

                Navigator.pop(context);
              }, child: const Text("Add task"));
              })
              
            ],
          )),
      )
    );
  }
}