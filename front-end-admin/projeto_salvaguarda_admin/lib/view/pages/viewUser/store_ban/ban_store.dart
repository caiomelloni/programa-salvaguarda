import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_salvaguarda_admin/services/banUser/errors/ban_errors.dart';
import 'package:projeto_salvaguarda_admin/services/banUser/service/ban_user_service.dart';

part 'ban_store.g.dart';

class BanUserController = _BanUserController with _$BanUserController;

abstract class _BanUserController with Store {
  @observable
  bool isLoading = false;

  @action
  Future<void> tryBanUser() async {
    isLoading = true;
    try {
      await BanUserService.service.RequestBanUser();
    } on CantBanUser {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
