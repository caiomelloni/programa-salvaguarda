// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disable_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DisableUserController on _DisableUserController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_DisableUserController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$tryDisableUserAsyncAction =
      AsyncAction('_DisableUserController.tryDisableUser', context: context);

  @override
  Future<void> tryDisableUser() {
    return _$tryDisableUserAsyncAction.run(() => super.tryDisableUser());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
