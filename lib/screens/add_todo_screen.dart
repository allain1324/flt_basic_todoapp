import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftl_basic_todoapp/blocs/todo_bloc.dart';
import 'package:ftl_basic_todoapp/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  initState() {
    super.initState();
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              TodoModel todo = TodoModel(
                  id: const Uuid().v4(),
                  title: 'Hello',
                  description: '123',
                  isCompleted: false);
              context.read<TodoBloc>().add(AddTodo(todo));
              Navigator.of(context).pop();
            },
            child: Text("Add todo")),
      ),
    );
  }
}
