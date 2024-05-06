import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_sample/routing/routes.dart';

part 'go_router.g.dart';

@Riverpod(dependencies: [])
GoRouter router(RouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: $appRoutes,
  );
}
