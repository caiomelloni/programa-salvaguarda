// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditProfileController on _EditProfileController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_EditProfileController.isLoading', context: context);

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

  late final _$updateUserAsyncAction =
      AsyncAction('_EditProfileController.updateUser', context: context);

  @override
  Future<void> updateUser() {
    return _$updateUserAsyncAction.run(() => super.updateUser());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
