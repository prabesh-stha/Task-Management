class Tasks {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdDate = DateTime.now();
  final DateTime deadlineDate;

  Tasks({required this.id, required this.title, required this.description, this.isCompleted = false, required this.deadlineDate});

  Tasks copyWith({
    String? id, String? title, String? description, bool? isCompleted, DateTime? createdDate, DateTime? deadlineDate
  }){
    return Tasks(id: id ?? this.id, title: title?? this.title, description: description ?? this.description, isCompleted: isCompleted ?? this.isCompleted, deadlineDate: deadlineDate ?? this.deadlineDate);
  }
}