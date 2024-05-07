import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_sample/providers/todo_providers.dart';

part 'todo_notifier.g.dart';

@riverpod
class TodoNotifier extends _$TodoNotifier {
  @override
  Future<void> build(String todoId) async {
    return;
  }

  Future<void> delete({required Function callback}) async {
    await ref.read(todoRepositoryProvider).delete(todoId);

    callback();
  }

  Future<void> setDone(bool done) async {
    await ref.read(todoRepositoryProvider).setDone(todoId, done);
  }
}
