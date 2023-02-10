// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enable_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EnableCertificateController on _EnableCertificateController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_EnableCertificateController.isLoading', context: context);

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

  late final _$tryEnableCertificateUserAsyncAction = AsyncAction(
      '_EnableCertificateController.tryEnableCertificateUser',
      context: context);

  @override
  Future<void> tryEnableCertificateUser(SalvaGuardaVolunteers user) {
    return _$tryEnableCertificateUserAsyncAction
        .run(() => super.tryEnableCertificateUser(user));
  }

  late final _$tryEnableAllCertificateUserAsyncAction = AsyncAction(
      '_EnableCertificateController.tryEnableAllCertificateUser',
      context: context);

  @override
  Future<void> tryEnableAllCertificateUser() {
    return _$tryEnableAllCertificateUserAsyncAction
        .run(() => super.tryEnableAllCertificateUser());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
