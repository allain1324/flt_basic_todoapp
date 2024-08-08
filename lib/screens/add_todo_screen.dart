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
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    print('TodoBloc123: $todoBloc'); // Check if the Bloc is found
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Text('Add Todo Screen'),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Add Todo'),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Form(
  //         key: _formKey,
  //         child: Column(
  //           children: [
  //             TextFormField(
  //               controller: _titleController,
  //               decoration: const InputDecoration(labelText: 'Title'),
  //             ),
  //             TextFormField(
  //               controller: _descriptionController,
  //               decoration: const InputDecoration(labelText: 'Description'),
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 if (_formKey.currentState!.validate()) {
  //                   final todo = TodoModel(
  //                     id: Uuid().v4(),
  //                     title: _titleController.text,
  //                     description: _descriptionController.text,
  //                     isCompleted: false,
  //                   );
  //                   context.read<TodoBloc>().add(AddTodo(todo));
  //                   Navigator.of(context).pop();
  //                 }
  //               },
  //               child: const Text('Add Todo'),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
