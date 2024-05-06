import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_sample/models/todo.dart';
import 'package:todo_sample/repositories/todo_repository.dart';

part 'todo_providers.g.dart';

@Riverpod(dependencies: [])
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  return FirebaseFirestore.instance;
}

@Riverpod(dependencies: [firebaseFirestore])
TodoRepository todoRepository(TodoRepositoryRef ref) {
  final firebaseFirestore = ref.read(firebaseFirestoreProvider);
  return TodoRepository(firebaseFirestore);
}

@Riverpod(dependencies: [todoRepository])
Stream<List<Todo>> todos(TodosRef ref) {
  final repository = ref.read(todoRepositoryProvider);
  return repository.todos();
}
