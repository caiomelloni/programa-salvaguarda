// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workload_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorkLoadController on _WorkLoadController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_WorkLoadController.isLoading', context: context);

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

  late final _$submitWorkLoadAsyncAction =
      AsyncAction('_WorkLoadController.submitWorkLoad', context: context);

  @override
  Future<void> submitWorkLoad() {
    return _$submitWorkLoadAsyncAction.run(() => super.submitWorkLoad());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
