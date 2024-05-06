import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_sample/screens/create_todo/create_todo_page.dart';
import 'package:todo_sample/main.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/', routes: [
  TypedGoRoute<CreateTodoRoute>(path: 'create-todo'),
])
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const MyHomePage();
}

@immutable
class CreateTodoRoute extends GoRouteData {
  const CreateTodoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CreateTodoPage();
}
