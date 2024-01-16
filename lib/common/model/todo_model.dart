class TodoModel {
  String? todoTitle;
  String? category;
  String? todoDate;
  String? todoTime;
  bool? inImportant;
  bool? isCompleted;

  TodoModel({
    this.todoTitle,
    this.category,
    this.todoDate,
    this.todoTime,
    this.inImportant,
    this.isCompleted
  });

  TodoModel copyWith({
    String? todoTitle,
    String? category,
    String? todoDate,
    String? todoTime,
    bool? inImportant,
    bool? isCompleted
  }) {
    return TodoModel(
      todoTitle: todoTitle ?? this.todoTitle,
      category: category ?? this.category,
      todoDate: todoDate ?? this.todoDate,
      todoTime: todoTime ?? this.todoTime,
      inImportant: inImportant ?? this.inImportant,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
