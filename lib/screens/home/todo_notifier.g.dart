// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoNotifierHash() => r'd19f44ddad2a2306a4c1e96f09177819cf921d1d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TodoNotifier extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String todoId;

  FutureOr<void> build(
    String todoId,
  );
}

/// See also [TodoNotifier].
@ProviderFor(TodoNotifier)
const todoNotifierProvider = TodoNotifierFamily();

/// See also [TodoNotifier].
class TodoNotifierFamily extends Family<AsyncValue<void>> {
  /// See also [TodoNotifier].
  const TodoNotifierFamily();

  /// See also [TodoNotifier].
  TodoNotifierProvider call(
    String todoId,
  ) {
    return TodoNotifierProvider(
      todoId,
    );
  }

  @override
  TodoNotifierProvider getProviderOverride(
    covariant TodoNotifierProvider provider,
  ) {
    return call(
      provider.todoId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'todoNotifierProvider';
}

/// See also [TodoNotifier].
class TodoNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TodoNotifier, void> {
  /// See also [TodoNotifier].
  TodoNotifierProvider(
    String todoId,
  ) : this._internal(
          () => TodoNotifier()..todoId = todoId,
          from: todoNotifierProvider,
          name: r'todoNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$todoNotifierHash,
          dependencies: TodoNotifierFamily._dependencies,
          allTransitiveDependencies:
              TodoNotifierFamily._allTransitiveDependencies,
          todoId: todoId,
        );

  TodoNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.todoId,
  }) : super.internal();

  final String todoId;

  @override
  FutureOr<void> runNotifierBuild(
    covariant TodoNotifier notifier,
  ) {
    return notifier.build(
      todoId,
    );
  }

  @override
  Override overrideWith(TodoNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TodoNotifierProvider._internal(
        () => create()..todoId = todoId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        todoId: todoId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TodoNotifier, void> createElement() {
    return _TodoNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TodoNotifierProvider && other.todoId == todoId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, todoId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TodoNotifierRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `todoId` of this provider.
  String get todoId;
}

class _TodoNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TodoNotifier, void>
    with TodoNotifierRef {
  _TodoNotifierProviderElement(super.provider);

  @override
  String get todoId => (origin as TodoNotifierProvider).todoId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
