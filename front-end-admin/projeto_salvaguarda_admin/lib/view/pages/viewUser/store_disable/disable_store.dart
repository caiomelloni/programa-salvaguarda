import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_salvaguarda_admin/services/disableUser/errors/disable_errors.dart';
import 'package:projeto_salvaguarda_admin/services/disableUser/service/disable_user_service.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';

part 'disable_store.g.dart';

class DisableUserController = _DisableUserController
    with _$DisableUserController;

abstract class _DisableUserController with Store {
  @observable
  bool isLoading = false;

  @action
  Future<void> tryDisableUser(SalvaGuardaVolunteers user) async {
    isLoading = true;
    try {
      await DisableUserService.service.requestDisableUser(user);
    } on CantDisableException {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
