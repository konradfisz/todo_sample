import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_sample/screens/create_todo/create_todo_notifier.dart';

class CreateTodoPage extends HookConsumerWidget {
  const CreateTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();

    final pending = useState<Future<void>?>(null);
    final snapshot = useFuture(pending.value);

    final isFormValid = useState<bool>(false);

    void checkFormValidity() {
      isFormValid.value = titleController.text.isNotEmpty && descriptionController.text.isNotEmpty;
    }

    titleController.addListener(checkFormValidity);
    descriptionController.addListener(checkFormValidity);

    useEffect(() {
      checkFormValidity();
      return null;
    }, [titleController, descriptionController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create TODO'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              ElevatedButton(
                onPressed: isFormValid.value
                    ? () {
                        pending.value = ref
                            .read(createTodoNotifierProvider.notifier)
                            .create(titleController.text, descriptionController.text, () => context.pop());
                      }
                    : null,
                child: snapshot.connectionState == ConnectionState.waiting
                    ? const CircularProgressIndicator()
                    : const Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
