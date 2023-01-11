import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_salvaguarda_admin/services/enable_certificate_tutor/errors/enable_certiificate_errors.dart';
import 'package:projeto_salvaguarda_admin/services/enable_certificate_tutor/service/enable_user_service.dart';

part 'enable_store.g.dart';

class EnableCertificateController = _EnableCertificateController
    with _$EnableCertificateController;

abstract class _EnableCertificateController with Store {
  @observable
  bool isLoading = false;

  @action
  Future<void> tryEnableCertificateUser() async {
    isLoading = true;
    try {
      await EnableCertificateService.service.requestEnableCertificate();
    } on CantEnableException {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
