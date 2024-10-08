import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftl_basic_todoapp/blocs/todo_bloc.dart';
import 'package:ftl_basic_todoapp/models/todo_model.dart';
import 'package:ftl_basic_todoapp/repositories/todo_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ftl_basic_todoapp/screens/todo_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todos');
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              TodoBloc(TodoRepository(Hive.box<TodoModel>('todos')))
                ..add(LoadTodo()),
        ),
      ],
      child: const TodoListScreen(),
    );
  }
}
