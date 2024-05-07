import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_sample/routing/routes.dart';
import 'package:todo_sample/screens/home/todo_notifier.dart';
import 'package:todo_sample/providers/todo_providers.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(const CreateTodoRoute().location);
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: switch (todos) {
          AsyncValue(:final error?) => Text('Error: $error'),
          AsyncValue(:final value, hasValue: true) => SingleChildScrollView(
              child: Column(
                children: [
                  ...?value?.map((e) => HookConsumer(
                        builder: (context, ref, child) {
                          final pending = useState<Future<void>?>(null);
                          final snapshot = useFuture(pending.value);

                          return ListTile(
                            title: Text(e.title),
                            onLongPress: () => showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Delete TODO'),
                                  content: const Text('Are you sure you want to delete this TODO?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        pending.value = ref
                                            .read(todoNotifierProvider(e.id).notifier)
                                            .delete(callback: () => context.pop());
                                      },
                                      child: const Text('Delete'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                  ],
                                );
                              },
                            ),
                            subtitle: Text(e.description),
                            trailing: snapshot.connectionState == ConnectionState.waiting
                                ? const CircularProgressIndicator()
                                : Checkbox(
                                    value: e.done,
                                    onChanged: (value) =>
                                        pending.value = ref.read(todoNotifierProvider(e.id).notifier).setDone(!e.done),
                                  ),
                          );
                        },
                      )),
                ],
              ),
            ),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ),
    );
  }
}
