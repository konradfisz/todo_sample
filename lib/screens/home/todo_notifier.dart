import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_sample/screens/home/todo_providers.dart';

part 'todo_notifier.g.dart';

@riverpod
class TodoNotifier extends _$TodoNotifier {
  @override
  Future<void> build(String todoId) async {
    return;
  }

  Future<void> delete() async {
    await ref.read(todoRepositoryProvider).delete(todoId);
  }

  Future<void> setDone(bool done) async {
    await ref.read(todoRepositoryProvider).setDone(todoId, done);
  }
}
