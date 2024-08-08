import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftl_basic_todoapp/blocs/todo_bloc.dart';
import 'package:ftl_basic_todoapp/models/todo_model.dart';
import 'package:ftl_basic_todoapp/screens/edit_todo_screen.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todo;

  TodoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (contextData, stateData) {
        print('stateData: $stateData');
        return ListTile(
          title: Text(todo.title),
          subtitle: Text(todo.description),
          trailing: Checkbox(
            value: todo.isCompleted,
            onChanged: (bool? value) {
              final updatedTodo = TodoModel(
                id: todo.id,
                title: todo.title,
                description: todo.description,
                isCompleted: value!,
              );
              contextData.read<TodoBloc>().add(UpdateTodo(updatedTodo));
            },
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditTodoScreen(todo: todo),
              ),
            );
          },
          onLongPress: () {
            contextData.read<TodoBloc>().add(DeleteTodo(todo.id));
          },
        );
      },
    );
  }
}
