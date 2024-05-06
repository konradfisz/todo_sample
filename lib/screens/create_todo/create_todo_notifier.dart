import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_sample/screens/home/todo_providers.dart';

part 'create_todo_notifier.g.dart';

@riverpod
class CreateTodoNotifier extends _$CreateTodoNotifier {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> create(String title, String description, Function callback) async {
    await ref.read(todoRepositoryProvider).add(title, description);

    callback();
  }
}
