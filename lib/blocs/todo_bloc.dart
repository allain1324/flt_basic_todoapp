import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ftl_basic_todoapp/models/todo_model.dart';
import 'package:ftl_basic_todoapp/repositories/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc(this.todoRepository) : super(TodoInitial()) {
    print('TodoBloc ${todoRepository.getAll()}');
    on<LoadTodo>(_onLoadTodo);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  void _onLoadTodo(LoadTodo event, Emitter<TodoState> emit) async {
    emit(TodoLoadInProgress());
    try {
      final todos = await todoRepository.getAll();
      print('LoadTodo $todos');
      emit(TodoLoadSuccess(todos));
    } catch (_) {
      emit(TodoLoadFailure());
    }
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    todoRepository.add(event.todo);
    add(LoadTodo());
  }

  void _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) {
    todoRepository.update(event.todo);
    add(LoadTodo());
  }

  void _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) {
    todoRepository.delete(event.id);
    add(LoadTodo());
  }
}
