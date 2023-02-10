// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pendency_api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PendecyApiController on _PendecyApiController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_PendecyApiController.isLoading', context: context);

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

  late final _$tryFetchOnePendencyAsyncAction = AsyncAction(
      '_PendecyApiController.tryFetchOnePendency',
      context: context);

  @override
  Future<List<PendenciesModel>?> tryFetchOnePendency(String body) {
    return _$tryFetchOnePendencyAsyncAction
        .run(() => super.tryFetchOnePendency(body));
  }

  late final _$tryFetchPendenciesAsyncAction =
      AsyncAction('_PendecyApiController.tryFetchPendencies', context: context);

  @override
  Future<List<PendenciesModel>?> tryFetchPendencies() {
    return _$tryFetchPendenciesAsyncAction
        .run(() => super.tryFetchPendencies());
  }

  late final _$tryUpdateRegisterPendencyAsyncAction = AsyncAction(
      '_PendecyApiController.tryUpdateRegisterPendency',
      context: context);

  @override
  Future<PendenciesModel?> tryUpdateRegisterPendency(int id) {
    return _$tryUpdateRegisterPendencyAsyncAction
        .run(() => super.tryUpdateRegisterPendency(id));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
