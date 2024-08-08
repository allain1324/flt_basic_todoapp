import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftl_basic_todoapp/screens/add_todo_screen.dart';
import 'package:ftl_basic_todoapp/widgets/todo_item.dart';
import 'package:hive/hive.dart';
import 'package:ftl_basic_todoapp/blocs/todo_bloc.dart';
import 'package:ftl_basic_todoapp/models/todo_model.dart';
import 'package:ftl_basic_todoapp/repositories/todo_repository.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (contextData, stateData) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Todo List'),
          ),
          body: BlocBuilder<TodoBloc, TodoState>(
            builder: (contextData, stateData) {
              if (stateData is TodoLoadInProgress) {
                return const Center(child: CircularProgressIndicator());
              } else if (stateData is TodoLoadSuccess) {
                print('state: ${stateData.todos}');
                return ListView.builder(
                  itemCount: stateData.todos.length,
                  itemBuilder: (context, index) {
                    return TodoItem(todo: stateData.todos[index]);
                  },
                );
              } else {
                return const Center(child: Text('Failed to load todos'));
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('Navigator $stateData');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: BlocProvider.of<TodoBloc>(
                        contextData), // Pass the existing TodoBloc instance
                    child: const AddTodoScreen(),
                  ),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
