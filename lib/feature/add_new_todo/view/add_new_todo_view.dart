import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/add_new_todo/widget/add_new_todo_body.dart';
import 'package:flutter_boilerplate/feature/add_new_todo/widget/add_todo_button.dart';

class AddNewTodoView extends StatelessWidget {
  const AddNewTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AddNewTodoBody()),
      floatingActionButton: AddToDoButton()
    );
  }
}
